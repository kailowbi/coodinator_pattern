struct MainView: View {
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("メイン画面")
                .font(.title)

            Button("詳細画面を表示") {
                coordinator.push(.detail(id: UUID()))
            }

            Button("設定を表示") {
                coordinator.present(sheet: .settings)
            }

            Button("プロフィールを表示") {
                coordinator.present(fullScreen: .profile)
            }
        }
        .padding()
    }
}