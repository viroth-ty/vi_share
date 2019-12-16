import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ViShare {
  static const MethodChannel _channel =
      const MethodChannel('vi_share');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static get showAlertDialog async {
    await _channel.invokeMethod('showAlertDialog');
  }

  static void shareToFacebook({@required String contentURL, String message = ""}) async {
    await _channel.invokeMethod('shareToFacebook',<String, String>{
      'url': contentURL,
      'message': message,
    });
  }
}
