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
        // Configura o Firebase
        FirebaseApp.configure()

        // Configura o delegate do UNUserNotificationCenter para gerenciar notificações
        UNUserNotificationCenter.current().delegate = self
        
        // Solicita permissão para enviar notificações
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
            if let error = error {
                print("Erro ao solicitar autorização de notificação: \(error.localizedDescription)")
            }
            print("Permissão para notificações concedida: \(granted)")
        }

        // Registra o dispositivo para receber notificações remotas
        application.registerForRemoteNotifications()
        
        // Define o delegate do Firebase Messaging
        Messaging.messaging().delegate = self

        return true
    }

    // Recebe o token de registro do FCM
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Token FCM recebido: \(String(describing: fcmToken))")
        saveFcmTokenToFirestore(fcmToken)
    }

    // Salva o token FCM no Firestore
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

// Extensão para o UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {

    // Permite que a notificação seja exibida enquanto o app está em primeiro plano
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }

    // Lida com a notificação quando o usuário interage com ela
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Notificação recebida com dados: \(response.notification.request.content.userInfo)")
        completionHandler()
    }
}
