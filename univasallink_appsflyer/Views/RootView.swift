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
    }
}