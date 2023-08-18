import AppKit
import ComposableArchitecture
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
  var window: NSWindow!

  func applicationDidFinishLaunching(_: Notification) {
    let contentView = ContentView(store: Store(initialState: CounterFeature.State()) {
      CounterFeature()
    })
      .frame(minWidth: 300, minHeight: 200)
      .edgesIgnoringSafeArea(.all)

    window = NSWindow(
      contentRect: NSRect(x: 0, y: 0, width: 800, height: 600),
      styleMask: [.titled, .closable, .miniaturizable, .resizable],
      backing: .buffered,
      defer: false
    )

    window.center()
    window.title = "Swift UI Hello World"
    window.contentView = NSHostingView(rootView: contentView)
    NSApp.activate(ignoringOtherApps: true)
    window.makeKeyAndOrderFront(nil)
  }
}

let appDelegate = AppDelegate()
NSApplication.shared.delegate = appDelegate
NSApplication.shared.run()
