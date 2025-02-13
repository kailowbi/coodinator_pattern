import SwiftUI

struct DetailView: View {
    let id: UUID
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Detail View")
                .font(.title)

            Text("ID: \(id.uuidString)")
                .font(.caption)
                .foregroundColor(.secondary)

            Button("Go Detail") {
                coordinator.push(.detail(id: UUID()))
            }
            
            Button("Go Back") {
                coordinator.pop()
            }
            .buttonStyle(.bordered)
            
            Button("Go Root") {
                coordinator.popToRoot()
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
