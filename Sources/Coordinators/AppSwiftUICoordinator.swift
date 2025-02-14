import SwiftUI

enum AppRoute: Hashable, Identifiable {
    case main
    case detail(id: UUID)
    case settings
    case profile
    case notifications
    case watchlist

    var id: String {
        switch self {
        case .main:
            return "main"
        case .detail(let id):
            return "detail-\(id.uuidString)"
        case .settings:
            return "settings"
        case .profile:
            return "profile"
        case .notifications:
            return "notifications"
        case .watchlist:
            return "watchlist"
        }
    }
}

final class AppSwiftUICoordinator: SwiftUICoordinator {
    static let shared = AppSwiftUICoordinator()

    @Published var path = NavigationPath()
    @Published var sheet: AppRoute?
    @Published var fullScreenCover: AppRoute?

    private init(path: NavigationPath = NavigationPath(), sheet: AppRoute? = nil, fullScreenCover: AppRoute? = nil) {
        self.path = path
        self.sheet = sheet
        self.fullScreenCover = fullScreenCover
    }

    func coordinateToView(for route: AppRoute) -> some View {
        VStack(){
            switch route {
            case .main:
                MainView(coordinator: self)
            case .detail(let id):
                DetailView(id: id, coordinator: self)
            case .settings:
                SettingsView(coordinator: self)
            case .profile:
                ProfileView(coordinator: self)
            case .notifications:
                NotificationsView(coordinator: self)
            case .watchlist:
                NavigationControllerRepresentable()
            }
        }
    }
}
