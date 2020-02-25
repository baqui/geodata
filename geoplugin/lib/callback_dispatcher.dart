import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void callbackDispatcher() {
  const MethodChannel _backgroundChannel = MethodChannel('com.desmart.geoplugin/geodata_background');
  WidgetsFlutterBinding.ensureInitialized();

  _backgroundChannel.setMethodCallHandler((MethodCall call) async {

    print('_backgroundChannel.setMethodCallHandler');

    final List<dynamic> args = call.arguments;
    final Function callback = PluginUtilities.getCallbackFromHandle(CallbackHandle.fromRawHandle(args[0]));
    
    assert(callback != null);
    print(args.sublist(1));
    callback(args.sublist(1));
  });

  print('Geoplugin.initialized');
  _backgroundChannel.invokeMethod('Geoplugin.initialized');
}
