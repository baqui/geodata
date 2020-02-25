package com.desmart.geoplugin

import android.Manifest
import android.util.Log
import android.os.Build
import android.os.PersistableBundle
import android.app.Activity
import android.app.job.JobScheduler
import android.app.job.JobInfo
import android.content.ComponentName
import android.content.Context

import java.util.concurrent.TimeUnit

import io.flutter.view.FlutterMain
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class GeopluginPlugin(context: Context, activity: Activity?): MethodCallHandler {
  private val mContext = context //to get to shared preferences
  private val mActivity = activity //to request permitions

  companion object {
    @JvmStatic 
    private val TAG = "Geoplugin"
    @JvmStatic 
    val SHARED_PREFERENCES_KEY = "geofencing_plugin_cache"
    @JvmStatic
    val CALLBACK_DISPATCHER_HANDLE_KEY = "callback_dispatch_handler"
    @JvmStatic
    private val REQUIRED_PERMISSIONS = arrayOf(Manifest.permission.ACCESS_FINE_LOCATION)

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "com.desmart.geoplugin/geodata")
      channel.setMethodCallHandler(GeopluginPlugin(registrar.context(), registrar.activity()))
    }

    @JvmStatic
    private fun initializeService(context: Context, args: ArrayList<*>?) {
        Log.d(TAG, "Set calbackDispatcher")
        val callbackHandle = args!![0] as Long
        context.getSharedPreferences(SHARED_PREFERENCES_KEY, Context.MODE_PRIVATE)
                .edit()
                .putLong(CALLBACK_DISPATCHER_HANDLE_KEY, callbackHandle)
                .apply()
    }

    @JvmStatic
    private fun startService(context: Context, args: ArrayList<*>?) {
        Log.d(TAG, "startService - scheduling job")
        val handle = args!![0] as Long
        val jobScheduler = context.getSystemService(Context.JOB_SCHEDULER_SERVICE) as JobScheduler

        // TODO: pass callback here and adjust calbackDispatcher to arguments passed here
        val extras = PersistableBundle()
        extras.putLong("handle", handle)

        FlutterMain.ensureInitializationComplete(context, null)
        jobScheduler.schedule(
          JobInfo.Builder(0, ComponentName(context, GeopluginService::class.java))
                .setMinimumLatency(3000L) //TimeUnit.MINUTES.toMillis(1), also see .setPeriodic method and check if jobscheduler cancelAll removes job calling, .setMinimumLatency
                .setExtras(extras)
                .build())
    }

    @JvmStatic
    private fun stopService(context: Context) {
        val jobScheduler = context.getSystemService(Context.JOB_SCHEDULER_SERVICE) as JobScheduler
        jobScheduler.cancelAll()
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
      val args = call.arguments<ArrayList<*>>()
      when(call.method) {
          "Geoplugin.initializeService" -> {
              Log.d(TAG, "Geoplugin.initializeService")
              if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                  mActivity?.requestPermissions(REQUIRED_PERMISSIONS, 12312)
              }
              initializeService(mContext, args)
              result.success(true)
          }
          "Geoplugin.startService" -> {
            Log.d(TAG, "Geoplugin.startService")
            startService(mContext, args)
          }
          "Geoplugin.stopService" -> {
            Log.d(TAG, "Geoplugin.stopService")
            stopService(mContext)
          }
          else -> result.notImplemented()
      }
  }
}
