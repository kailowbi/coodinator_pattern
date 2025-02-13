import SwiftUI

struct SettingsView: View {
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        NavigationView {
            List {
                Section("Account") {
                    Text("User Profile")
                    Text("Notifications")
                    Text("Privacy")
                }

                Section("App") {
                    Text("About")
                    Text("Help")
                    Text("Version 1.0.0")
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        coordinator.dismiss()
                    }
                }
            }
        }
    }
}