import Flutter
import UIKit

public class SwiftViSharePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "vi_share", binaryMessenger: registrar.messenger())
    let instance = SwiftViSharePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
    if (call.method == "getPlatformVersion") {
        result("iOS " + UIDevice.current.systemVersion)
    }
    else if (call.method == "showAlertDialog") {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: "Hi, My name is flutter", preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
        }
    }
  }

}
