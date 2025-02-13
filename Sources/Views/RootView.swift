import SwiftUI

struct RootView: View {
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        NavigationStack(path: Binding(get: { coordinator.path },
                                      set: { coordinator.path = $0 })) {
            coordinator.coordinateToView(for: .main)
                .navigationDestination(for: AppRoute.self) { route in
                    coordinator.coordinateToView(for: route)
                }
        }
        .sheet(item: Binding(get: { coordinator.sheet },
                             set: { coordinator.sheet = $0 })) { route in
            coordinator.coordinateToView(for: route)
        }
        .fullScreenCover(item: Binding(get: { coordinator.fullScreenCover },
                                       set: { coordinator.fullScreenCover = $0 })) { route in
            coordinator.coordinateToView(for: route)
        }
        .onOpenURL(perform: { url in
            LaunchHandller(url: url, coordinator: coordinator).handle()
        })
    }
}

enum LaunchType {
    typealias UserInfo = [AnyHashable : Any]

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
