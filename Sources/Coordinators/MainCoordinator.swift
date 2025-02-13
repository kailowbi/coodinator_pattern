import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
//        let viewController = MainViewController()
//        viewController.coordinator = self
//        navigationController.pushViewController(viewController, animated: false)
    }

    func showDetail() {
//        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
//        addChildCoordinator(detailCoordinator)
//        detailCoordinator.start()
    }
}
