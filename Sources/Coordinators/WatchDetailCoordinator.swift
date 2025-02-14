import UIKit

class WatchDetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
       let viewController = WatchDetailViewController()
       viewController.coordinator = self
       navigationController.pushViewController(viewController, animated: true)
    }

    func showDetail() {
       let detailCoordinator = WatchDetailCoordinator(navigationController: navigationController)
       addChildCoordinator(detailCoordinator)
       detailCoordinator.start()
    }
}
