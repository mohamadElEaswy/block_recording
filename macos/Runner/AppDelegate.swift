import Cocoa
import FlutterMacOS


@main
class AppDelegate: FlutterAppDelegate {
  override func applicationDidFinishLaunching(_ aNotification: Notification) {
    if let window = mainFlutterWindow {
      window.sharingType = .none // Disable both screen recording and screenshots
    }

    super.applicationDidFinishLaunching(aNotification)
  }
}
