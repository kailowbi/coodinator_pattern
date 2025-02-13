import SwiftUI

struct ProfileView: View {
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)

                Text("John Doe")
                    .font(.title)

                List {
                    Section("Personal Information") {
                        Label("john.doe@example.com", systemImage: "envelope")
                        Label("+1 234 567 890", systemImage: "phone")
                    }

                    Section("Preferences") {
                        Toggle("Notifications", isOn: .constant(true))
                        Toggle("Dark Mode", isOn: .constant(false))
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        coordinator.dismiss()
                    }
                }
            }
        }
    }
}