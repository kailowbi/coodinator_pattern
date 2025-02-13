import SwiftUI

struct NotificationsView: View {
    @ObservedObject var coordinator: AppSwiftUICoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Notifications View")
                .font(.title)

            Button("Push Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                    // [.alert, .badge, .sound]と指定されているので、「アラート、バッジ、サウンド」の3つに対しての許可をリクエストした
                    if granted {
                        // 「許可」が押された場合
                    } else {
                        // 「許可しない」が押された場合
                    }
                }
            }

            Button("Local Push Fire") {
                let content: UNMutableNotificationContent = UNMutableNotificationContent()
                content.title = "notificationTitle"
                content.body = "This is the notification message"
                content.sound = UNNotificationSound.default
                content.badge = 1
                content.userInfo = [
                    "route": "settings",
                    "id": UUID().uuidString,
                    "type": "local_notification",
                    "url": "coodinatorpattern://fromLocalNotification"
                ]

                // 現在時刻から5秒後に通知を設定
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else {
                        print("Notification scheduled successfully")
                    }
                }
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
