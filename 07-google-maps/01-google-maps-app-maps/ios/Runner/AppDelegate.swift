import UIKit
import Flutter
/// todo-01-03: import Google Maps library
import GoogleMaps  

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    /// todo-delete
    /// todo-01-04: Add your Google Maps API key here
    GMSServices.provideAPIKey("AIzaSyCsttTrcRHbRiQJp692mggXqhQOtiehcYk")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
