import SwiftUI

struct RootView: View {
    @StateObject private var coordinator = AppSwiftUICoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.coordinateToView(for: .main)
                .navigationDestination(for: AppRoute.self) { route in
                    coordinator.coordinateToView(for: route)
                }
        }
        .sheet(item: $coordinator.sheet) { route in
            coordinator.coordinateToView(for: route)
        }
        .fullScreenCover(item: $coordinator.fullScreenCover) { route in
            coordinator.coordinateToView(for: route)
        }
        .onOpenURL(perform: { url in
            LaunchHandller(url: url, coordinator: coordinator).handle()
        })
    }
}

enum LaunchType {
    case normal
    case notification
    case univasalLink
    case urlScheme
    case unknown
}

class LaunchHandller {
    private let launchType: LaunchType
    @ObservedObject var coordinator: AppSwiftUICoordinator

    init(url: URL, coordinator: AppSwiftUICoordinator) {
        self.launchType = LaunchHandller.generateLaunchType(url: url)
        self.coordinator = coordinator
    }

    private static func generateLaunchType(url: URL) -> LaunchType {
        guard let scheme = url.scheme else { return LaunchType.unknown }

        switch scheme {
        case "coodinatorpattern":
            return .urlScheme
        default:
            return .normal
        }
    }

    func handle() {
        switch launchType {
        case .urlScheme:
            coordinator.push(.settings)
        case .univasalLink:
            coordinator.push(.detail(id: UUID()))
            break
        default:
            break
        }
    }
}
