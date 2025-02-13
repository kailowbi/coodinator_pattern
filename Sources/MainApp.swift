import SwiftUI

@main
struct MainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var coordinator = AppSwiftUICoordinator.shared

    var body: some Scene {
        WindowGroup {
            RootView(coordinator: coordinator)
//                .environment(\.coordinator, coordinator)
        }
    }
}

