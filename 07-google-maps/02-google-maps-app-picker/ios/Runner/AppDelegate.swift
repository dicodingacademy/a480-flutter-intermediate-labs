import UIKit
import Flutter
import GoogleMaps  

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    /// todo-delete
    GMSServices.provideAPIKey("AIzaSyCsttTrcRHbRiQJp692mggXqhQOtiehcYk")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
