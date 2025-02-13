import SwiftUI

@main
struct MainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            RootView()
                .onOpenURL(perform: { (universalLink: URL) in
                    print(11)
                })
        }
    }
}

