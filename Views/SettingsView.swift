struct SettingsView: View {
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        NavigationView {
            VStack {
                Text("設定画面")

                Button("閉じる") {
                    coordinator.dismiss()
                }
            }
        }
    }
}