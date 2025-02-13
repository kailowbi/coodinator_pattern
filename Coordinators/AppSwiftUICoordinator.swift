enum AppRoute: Hashable {
    case main
    case detail(id: UUID)
    case settings
    case profile
}

@MainActor
final class AppSwiftUICoordinator: SwiftUICoordinator {
    @Published var path = NavigationPath()
    @Published var sheet: AppRoute?
    @Published var fullScreenCover: AppRoute?

    func coordinateToView(for route: AppRoute) -> some View {
        switch route {
        case .main:
            MainView(coordinator: self)
        case .detail(let id):
            DetailView(id: id, coordinator: self)
        case .settings:
            SettingsView(coordinator: self)
        case .profile:
            ProfileView(coordinator: self)
        }
    }
}