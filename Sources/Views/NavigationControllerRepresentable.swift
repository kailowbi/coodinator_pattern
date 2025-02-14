import SwiftUI

struct NavigationControllerRepresentable: UIViewControllerRepresentable {
    
    let navigationController = UINavigationController()
    let mainCoordinator: WatchListCoordinator
    
    init() {
        mainCoordinator = WatchListCoordinator(navigationController: navigationController)
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        mainCoordinator.start()
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // 更新が必要な場合はここに実装
    }
}
