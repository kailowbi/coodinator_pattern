struct ProfileView: View {
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        NavigationView {
            VStack {
                Text("プロフィール画面")

                Button("閉じる") {
                    coordinator.dismiss()
                }
            }
        }
    }
}