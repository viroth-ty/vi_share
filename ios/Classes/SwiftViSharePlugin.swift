import Flutter
import UIKit
import FBSDKShareKit

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
    }else if call.method == "shareToFacebook" {
        DispatchQueue.main.async {
            guard let args = call.arguments as? [String: String] else {
                print("Failed to get arguments")
                return
            }
            guard let URL = args["url"] else {return}
            guard let msg = args["message"] else {return}
            self.shareToFacebook(url: URL, msg: msg)
        }
    }
  }
    // Helper methods
    private func shareToFacebook(url: String, msg: String) {
        let controller = FacebookController(contentURL: url, message: msg)
        guard let content = controller.getShareContent() else {
            print("Content link could not be constructed")
            return
        }
        let shareDialog = ShareDialog()
        shareDialog.shareContent = content
        guard let rootController = UIApplication.shared.keyWindow?.rootViewController else {
            print("Could not retrieve a root view controller!")
            return
        }
        shareDialog.fromViewController = rootController
        shareDialog.show()
    }

}
