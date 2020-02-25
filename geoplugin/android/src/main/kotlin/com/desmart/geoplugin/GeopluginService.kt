package com.desmart.geoplugin

import android.content.Context
import android.app.job.JobService
import android.app.job.JobParameters
import android.util.Log
import java.util.concurrent.atomic.AtomicBoolean

import com.google.android.gms.location.FusedLocationProviderClient
//import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationServices
import android.location.Location

import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result

import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback

import io.flutter.view.FlutterMain
import io.flutter.view.FlutterCallbackInformation
import io.flutter.view.FlutterNativeView
import io.flutter.view.FlutterRunArguments

class GeopluginService : MethodCallHandler, JobService() {

    private lateinit var mBackgroundChannel: MethodChannel

    companion object {
        @JvmStatic
        private val TAG = "GeoDataService"

        @JvmStatic
        private lateinit var sPluginRegistrantCallback: PluginRegistrantCallback

        @JvmStatic
        private var sBackgroundFlutterView: FlutterNativeView? = null

        @JvmStatic
        private lateinit var fusedLocationClient: FusedLocationProviderClient

        @JvmStatic 
        private val sServiceStarted = AtomicBoolean(false)

        @JvmStatic
        fun setPluginRegistrant(callback: PluginRegistrantCallback) {
            Log.d(TAG, "GeopluginService setPluginRegistrant")
            sPluginRegistrantCallback = callback
        }
    }

    override fun onCreate() {
        super.onCreate()
        Log.d(TAG, "onCreate GeodataService")
        //FlutterMain.ensureInitializationComplete(this, null)
        initializeCallbackDispatcher(this)
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
    }

    override fun onStopJob(params: JobParameters?): Boolean {
        return false
    }

    override fun onStartJob(params: JobParameters?): Boolean {
        Log.d(TAG, "onStartJob GeodataService")
        val handle = params!!.extras.getLong("handle",-1)
        fusedLocationClient.lastLocation.addOnSuccessListener { location : Location? ->
            // Got last known location. In some rare situations this can be null.
            val lat = location?.getLatitude()
            val lng = location?.getLongitude()
            
            mBackgroundChannel.invokeMethod("", listOf(handle, lat, lng))
        }
        
        return false
    }

    private fun initializeCallbackDispatcher(context: Context) {
        if (sBackgroundFlutterView == null) {
            val callbackHandle = context.getSharedPreferences(
                                        GeopluginPlugin.SHARED_PREFERENCES_KEY,
                                        Context.MODE_PRIVATE
                                    )
                                    .getLong(GeopluginPlugin.CALLBACK_DISPATCHER_HANDLE_KEY, 0)

            val callbackInfo = FlutterCallbackInformation.lookupCallbackInformation(callbackHandle)
            if (callbackInfo == null) {
                Log.e(TAG, "Fatal: failed to find callback")
                return
            }
            Log.i(TAG, "initializeCallbackDispatcher ...")
            sBackgroundFlutterView = FlutterNativeView(context, true)

            val registry = sBackgroundFlutterView!!.pluginRegistry
            sPluginRegistrantCallback.registerWith(registry)
            val args = FlutterRunArguments()
            args.bundlePath = FlutterMain.findAppBundlePath(context)
            args.entrypoint = callbackInfo.callbackName
            args.libraryPath = callbackInfo.callbackLibraryPath

            sBackgroundFlutterView!!.runFromBundle(args)
        }
        mBackgroundChannel = MethodChannel(sBackgroundFlutterView, "com.desmart.geoplugin/geodata_background")
        mBackgroundChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when(call.method) {
            "Geoplugin.initialized" -> {
                Log.i(TAG, "CallbackDispatcher initialized - service")
                sServiceStarted.set(true)
                //mBackgroundChannel.invokeMethod("", null)
            }
            else -> result.notImplemented()
        }
        result.success(null)
    }
}