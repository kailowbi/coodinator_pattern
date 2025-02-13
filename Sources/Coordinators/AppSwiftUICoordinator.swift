import SwiftUI

enum AppRoute: Hashable, Identifiable {
    case main
    case detail(id: UUID)
    case settings
    case profile

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
        }
    }
}

@MainActor
final class AppSwiftUICoordinator: SwiftUICoordinator {
    @Published var path = NavigationPath()
    @Published var sheet: AppRoute?
    @Published var fullScreenCover: AppRoute?

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
            }
        }
    }
}
