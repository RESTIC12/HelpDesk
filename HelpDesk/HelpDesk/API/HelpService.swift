//
//  HelpService.swift
//  HelpDesk
//
//  Created by Joao Rocha on 01/08/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import UserNotifications
import SwiftJWT

public enum HelpDeskResultError: Swift.Error {
     case withoutConnectivity
     case invalidData
 }

public protocol HelpService {
    typealias HelpResult = Result<[HelpDesk], HelpDeskResultError>
    func load(completion: @escaping (HelpResult) -> Void)
    func createHelp(_ call: HelpDesk, method: String, completion: @escaping (Bool) -> Void)
}

public final class HelpServiceImp: HelpService {
    private let db = Firestore.firestore()

    public init() {}

    public func load(completion: @escaping (HelpService.HelpResult) -> Void) {
        let uid = SessionManager.shared.currentUser?.uid
        var query: Query = db.collection("chamados")
        
        switch SessionManager.shared.currentUser?.permissao {
        case 0:
            query = query.whereField("uid", isEqualTo: uid ?? "")
        case 1:
            query = query.whereField("details.departamento", isEqualTo: "TI")
        case 2:
            query = query.whereField("details.departamento", isEqualTo: "RH")
        default:
            break
        }

        query.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error)")
                completion(.failure(.withoutConnectivity))
            } else if let snapshot = snapshot {
                let helps = snapshot.documents.compactMap { document -> HelpDesk? in
                    do {
                        return try document.data(as: HelpDesk.self)
                    } catch {
                        print("Error decoding document: \(error)")
                        return nil
                    }
                }
                completion(.success(helps))
            } else {
                completion(.failure(.invalidData))
            }
        }
    }


    public func createHelp(_ call: HelpDesk, method: String = "POST", completion: @escaping (Bool) -> Void) {
        do {
            var ref: DocumentReference?
            if method == "PUT", let id = call.id {
                ref = db.collection("chamados").document(id)
            } else {
                ref = db.collection("chamados").document()
            }
            try ref?.setData(from: call, merge: true, completion: { error in
                if let error = error {
                    print("Error adding document: \(error)")
                    completion(false)
                } else {
                    self.notifyUsersAboutNewChamado(for: call)
                    completion(true)
                }
            })
        } catch let error {
            print("Error serializing data: \(error)")
            completion(false)
        }
    }

    private func notifyUsersAboutNewChamado(for call: HelpDesk) {
        // Aqui você vai buscar os usuários que devem ser notificados.
        let permissao = call.details.departamento == "TI" ? 1 : 2
        let query = db.collection("usuarios").whereField("permissao", isEqualTo: permissao)

        query.getDocuments { snapshot, error in
            if let error = error {
                print("Erro ao buscar usuários para notificação: \(error)")
                return
            }

            guard let documents = snapshot?.documents else {
                print("Nenhum usuário encontrado para notificação")
                return
            }

            for document in documents {
                if let fcmToken = document.data()["fcmToken"] as? String {
                    self.sendPushNotification(to: fcmToken, title: "Novo Chamado", body: "Você recebeu um novo chamado no departamento \(permissao).")
                }
            }
        }
    }


    private func getUserFcmToken(for department: String, completion: @escaping (String?) -> Void) {
        let db = Firestore.firestore()
        db.collection("usuarios").whereField("departamento", isEqualTo: department).getDocuments { snapshot, error in
            if let error = error {
                print("Erro ao recuperar token FCM: \(error.localizedDescription)")
                completion(nil)
            } else if let snapshot = snapshot, !snapshot.documents.isEmpty {
                let document = snapshot.documents.first
                let token = document?.data()["fcmToken"] as? String
                print("Token FCM recuperado com sucesso: \(token ?? "Token não encontrado")")
                completion(token)
            } else {
                print("Nenhum documento encontrado para o departamento: \(department)")
                completion(nil)
            }
        }
    }
    
    func sendPushNotification(to token: String, title: String, body: String) {
        guard let serverFcmToken = generateAccessToken() else { return }
        guard let url = URL(string: "https://fcm.googleapis.com/v1/projects/helpDesk-Group1/messages:send") else {
            print("URL inválida.")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(serverFcmToken)", forHTTPHeaderField: "Authorization")  // Substitua com sua chave do servidor FCM
        
        let payload: [String: Any] = [
            "message": [
                "token": token,
                "notification": [
                    "title": "Novo Chamado Criado",
                    "body": "Um novo chamado foi criado por um usuário com permissão 0."
                ]
            ]
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: [])
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Erro ao enviar notificação: \(error.localizedDescription)")
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("Notificação enviada com sucesso")
                    print(payload)
                } else {
                    print("Erro ao enviar notificação, statusCode: \(httpResponse.statusCode)")
                }
            }
        }
        task.resume()
    }

    func testNotification() {
        let testToken = "c89jbTkcJ0pYlt-EHidJzL:APA91bFRIXImiU0MEvS6R0v_30xtDfHzM2I1dm4ZkVO8REkPo7hCbSF-dapmvqxASXVPFpeM0Cyja0ggcZuWus5LWrnSAzsfLHNeBF9Sv--dITbgxsr4bkBj2u_3EF807zsJtuuKIUkr"
        sendPushNotification(to: testToken, title: "Test Notification", body: "This is a test notification.")
        print("funcao notificacao chamada")
    }

    struct MyClaims: Claims {
        let iss: String
        let scope: String
        let aud: String
        let iat: Date
        let exp: Date
    }

    func generateAccessToken() -> String? {
        // Caminho para o arquivo JSON da conta de serviço
        guard let serviceAccountPath = Bundle.main.path(forResource: "helpdesk-group1-d95eed309262", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: serviceAccountPath)),
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
              let clientEmail = json["client_email"] as? String,
              let privateKey = json["private_key"] as? String else {
            print("Erro ao carregar as credenciais da conta de serviço.")
            return nil
        }
        
        // Preparar os dados para o JWT
        let iat = Date()
        let exp = iat.addingTimeInterval(3600) // 1 hora de validade
        let claims = MyClaims(
            iss: clientEmail,
            scope: "https://www.googleapis.com/auth/firebase.messaging",
            aud: "https://oauth2.googleapis.com/token",
            iat: iat,
            exp: exp
        )
        
        var jwt = JWT(claims: claims)
        let jwtSigner = JWTSigner.rs256(privateKey: privateKey.data(using: .utf8)!)

        do {
            let signedJWT = try jwt.sign(using: jwtSigner)
            return signedJWT
        } catch {
            print("Erro ao assinar o JWT: \(error)")
            return nil
        }
    }
    

    func sendPushNotification() {
        guard let accessToken = generateAccessToken() else {
            print("Erro ao gerar o token de acesso.")
            return
        }
        
        guard let url = URL(string: "https://fcm.googleapis.com/v1/projects/YOUR_PROJECT_ID/messages:send") else {
            print("URL inválida.")
            return
        }
        
        let payload: [String: Any] = [
            "message": [
                "notification": [
                    "title": "Novo Chamado Criado",
                    "body": "Um novo chamado foi criado por um usuário com permissão 0."
                ],
                "topic": "users_with_permission_1_or_2"
            ]
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: [])
        } catch {
            print("Erro ao converter JSON: \(error.localizedDescription)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro ao enviar notificação: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("Notificação enviada com sucesso.")
                } else {
                    print("Erro ao enviar notificação, statusCode: \(httpResponse.statusCode)")
                }
            }
        }
        
        task.resume()
    }

}
