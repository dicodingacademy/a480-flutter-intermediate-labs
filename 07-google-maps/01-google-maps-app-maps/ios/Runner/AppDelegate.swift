import UIKit
import Flutter
/// todo-00-03: import Google Maps library
import GoogleMaps  

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    /// todo-00-04: Add your Google Maps API key here
    GMSServices.provideAPIKey("YOUR_API_KEY")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
