protocol SwiftUICoordinator: ObservableObject {
    associatedtype Route: Hashable

    var path: NavigationPath { get set }
    var sheet: Route? { get set }
    var fullScreenCover: Route? { get set }

    func push(_ route: Route)
    func present(sheet route: Route)
    func present(fullScreen route: Route)
    func pop()
    func popToRoot()
    func dismiss()
}

extension SwiftUICoordinator {
    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func present(sheet route: Route) {
        sheet = route
    }

    func present(fullScreen route: Route) {
        fullScreenCover = route
    }

    func dismiss() {
        sheet = nil
        fullScreenCover = nil
    }
}