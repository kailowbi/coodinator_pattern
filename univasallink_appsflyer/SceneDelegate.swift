import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       print(11)
//        if let userActivity = scene.userActivity { // <-- not quite
//            self.scene(scene, continue: userActivity)
//        }

        guard let userActivity
            = connectionOptions.userActivities
                .first(where: { $0.webpageURL != nil }) else { return }
        print(userActivity.webpageURL!)

        scene.delegate = self

    }

    func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String) {
        print(11)

//        if let userActivity = scene.userActivity { // <-- not quite
//                        print(11)
//            AppsFlyerLib.shared().continue(userActivity, restorationHandler: nil)
//
//        }
        scene.delegate = self
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print(11)
    }

//    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
//        AppsFlyerLib.shared().continue(userActivity, restorationHandler: nil)
//    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print(11)
    }
}
