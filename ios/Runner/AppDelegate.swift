import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    // MARK: - Private properties
    private let MEDIA_CHANNEL = "MEDIA_CHANNEL"
    private let OPEN_MEDIA = "OPEN_MEDIA"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      // modules
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let mediaChannel = FlutterMethodChannel(name: MEDIA_CHANNEL, binaryMessenger: controller.binaryMessenger)
      
      mediaChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          
          guard call.method == self?.OPEN_MEDIA else {
              result(FlutterMethodNotImplemented)
              return
          }
          
          self?.openMediaModule(result: result)
          
      })
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

extension AppDelegate {
    // MARK: - Private methods
    private func openMediaModule(result: FlutterResult){
        let mediaController = MediaController()
        mediaController.modalPresentationStyle = .fullScreen
        window?.rootViewController?.present(mediaController, animated: true)
        result(nil)
    }
}
