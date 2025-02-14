import UIKit

class WatchListCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = WatchListViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showDetail() {
        let detailCoordinator = WatchDetailCoordinator(navigationController: navigationController)
        addChildCoordinator(detailCoordinator)
        detailCoordinator.start()
    }
}
