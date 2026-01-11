import Flutter
import UIKit
import FacebookCore
import FacebookLogin

@main
@objc class AppDelegate: FlutterAppDelegate {
    // MARK: - Private properties
    private let MEDIA_CHANNEL = "MEDIA_CHANNEL"
    private let OPEN_MEDIA = "OPEN_MEDIA"
    
    private let FB_LOGIN_CHANNEL = "FB_LOGIN_CHANNEL"
    private let FB_LOGIN = "FB_LOGIN"
        
    private var currentNonce: String?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      // Facebook SDK Init
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
      
      // Flutter plugins
    GeneratedPluginRegistrant.register(with: self)
      
      // modules
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let mediaChannel = FlutterMethodChannel(name: MEDIA_CHANNEL, binaryMessenger: controller.binaryMessenger)
      let fbLoginChannel = FlutterMethodChannel(name: FB_LOGIN_CHANNEL, binaryMessenger: controller.binaryMessenger)
      
      mediaChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          
          guard call.method == self?.OPEN_MEDIA else {
              result(FlutterMethodNotImplemented)
              return
          }
          
          self?.openMediaModule(result: result)
          
      })
      
      fbLoginChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          
          guard call.method == self?.FB_LOGIN else {
              result(FlutterMethodNotImplemented)
              return
          }
          
          self?.loginFBLimited(result: result)
      })
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if ApplicationDelegate.shared.application(app, open: url, options: options) {
            return true
        }
        
        return super.application(app, open: url, options: options)
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
    
    
    private func loginFBLimited(result: @escaping FlutterResult) {
        let flutterResult = result
        let manager = LoginManager()
        
        let rawNonce = GenNonce.randomNonceString()
        let hashNonce = HashUtil.sha256(rawNonce)
        
        currentNonce = hashNonce
        
        let config = LoginConfiguration(
            permissions: ["public_profile", "email", "user_birthday"],
            tracking: .limited,
            nonce: hashNonce
        )
        
        print("config.nonce:: \(config?.nonce)")
        
        manager.logIn(configuration: config) { loginResult in
            switch loginResult {
            case .cancelled:
                flutterResult(nil)
            case .failed(let error):
                print("error:: \(error)")
                print("localizedDescription:: \(error.localizedDescription)")
                flutterResult(
                    FlutterError(code: "FB_LOGIN_FAILED", message: error.localizedDescription, details: nil)
                )
            case .success(let granted, let declined, let token):
                guard
                    let authToken = AuthenticationToken.current?.tokenString,
                    let nonce = self.currentNonce
                else {
                    flutterResult(
                        FlutterError(
                            code: "FB_TOKEN_EMPTY",
                            message: "Missing token or nonce",
                            details: nil
                        )
                    )
                    return
                }

                flutterResult([
                    "authToken": authToken,
                    "nonce": nonce
                ])
            }
        }
    }
}
