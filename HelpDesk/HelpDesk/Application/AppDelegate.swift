//
//  AppDelegate.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import Firebase
import FirebaseMessaging
import UserNotifications

class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        FirebaseApp.configure()

        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
            if let error = error {
                print("Erro ao solicitar autorização de notificação: \(error.localizedDescription)")
            }
            print("Permissão para notificações concedida: \(granted)")
        }

        application.registerForRemoteNotifications()
        
        Messaging.messaging().delegate = self

        return true
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Token FCM recebido: \(String(describing: fcmToken))")
        saveFcmTokenToFirestore(fcmToken)
    }

    private func saveFcmTokenToFirestore(_ token: String?) {
        guard let uid = Auth.auth().currentUser?.uid, let token = token else { return }
        let db = Firestore.firestore()
        db.collection("usuarios").document(uid).setData(["fcmToken": token], merge: true) { error in
            if let error = error {
                print("Erro ao salvar token FCM: \(error.localizedDescription)")
            } else {
                print("Token FCM salvo com sucesso")
            }
        }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Notificação recebida com dados: \(response.notification.request.content.userInfo)")
        completionHandler()
    }
}
