import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ViShare {
  static const MethodChannel _channel = const MethodChannel('vi_share');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static showAlertDialog({@required String url, String msg}) async {
    await _channel.invokeMethod('showAlertDialog');
    final Map<String, Object> arguments = Map<String, String>();
    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => url);
    await _channel.invokeMethod('shareFacebook', arguments);
  }
}
