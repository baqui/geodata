import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';

import './callback_dispatcher.dart';

class Geoplugin {
  static const MethodChannel _channel = MethodChannel('com.desmart.geoplugin/geodata');

  static Future<void> initialize() async {
    final CallbackHandle handle = PluginUtilities.getCallbackHandle(callbackDispatcher);
    await _channel.invokeMethod('Geoplugin.initializeService', <dynamic>[handle.toRawHandle()]);
  }

  static Future<void> startService( void Function(List<dynamic> args) callback) async {
    final CallbackHandle handle = PluginUtilities.getCallbackHandle(callback);
    await _channel.invokeMethod('Geoplugin.startService', <dynamic>[handle.toRawHandle()]);
  }

  static Future<void> stopService() async {
    await _channel.invokeMethod('Geoplugin.stopService');
  }
  
}
