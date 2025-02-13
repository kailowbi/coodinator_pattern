struct DetailView: View {
    let id: UUID
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        VStack {
            Text("詳細画面")
            Text("ID: \(id.uuidString)")

            Button("戻る") {
                coordinator.pop()
            }
        }
    }
}