import SwiftUI

//@MainActor
//private struct CoordinatorKey: EnvironmentKey {
//    static let defaultValue: AppSwiftUICoordinator = AppSwiftUICoordinator()
//}
//
//extension EnvironmentValues {
//    var coordinator: AppSwiftUICoordinator {
//        get { self[CoordinatorKey.self] }
//        set { self[CoordinatorKey.self] = newValue }
//    }
//}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    private var coordinator = AppSwiftUICoordinator.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        UNUserNotificationCenter.current().delegate = self
        // プッシュ通知による起動
        if let response = connectionOptions.notificationResponse {
            let userInfo = response.notification.request.content.userInfo
            // ① userInfoから特定のURLSchemeを埋め込んだkeyを取得して画面遷移など使用
        }

        guard let userActivity
            = connectionOptions.userActivities
                .first(where: { $0.webpageURL != nil }) else { return }
        print("willConnectTo:\(userActivity.webpageURL)" )
    }



//    func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String) {
//        print(11)
//
////        if let userActivity = scene.userActivity { // <-- not quite
////                        print(11)
////            AppsFlyerLib.shared().continue(userActivity, restorationHandler: nil)
////
////        }
//        scene.delegate = self
//    }

//    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
//    }
//
//    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//        print(11)
//    }

//    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
//        AppsFlyerLib.shared().continue(userActivity, restorationHandler: nil)
//    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print(11)
    }
}

// Notification
extension SceneDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let userInfo = response.notification.request.content.userInfo
        guard let urlString = userInfo["url"] as? String,
              let url = URL(string: urlString) else { return }

        LaunchHandller(url: url, coordinator: coordinator).handle()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        let userInfo = notification.request.content.userInfo
        print("Foreground notification userInfo:", userInfo)

        return [ .badge, .sound]
    }
}
