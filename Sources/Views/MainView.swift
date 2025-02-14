import SwiftUI

struct MainView: View {
    @ObservedObject var coordinator: AppSwiftUICoordinator
    @State private var showSettings = false

    var body: some View {
        VStack {
            Text("Main View")

            Button("Show Detail") {
                coordinator.push(.detail(id: UUID()))
            }

            Button("Show Notifications") {
                coordinator.present(sheet: .notifications)
            }

            Button("Show Settings") {
                coordinator.present(sheet: .settings)
            }

            Button("Show Profile") {
                coordinator.present(fullScreen: .profile)
            }
            
            Button("Show VCView") {
                coordinator.push(.watchlist)
            }
        }
    }
}
