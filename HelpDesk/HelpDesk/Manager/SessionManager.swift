//
//  SessionManager.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class SessionManager: ObservableObject {
    @Published var currentUser: User?
    @Published var userDataLoaded = false
    private let db = Firestore.firestore()
    static let shared = SessionManager()
    
    private init() {
        if let currentUser = Auth.auth().currentUser  {
            signIn(withUser: currentUser.uid)
        }
    }
    
    func signIn(withUser userId: String) {
        fetchUserData(uid: userId)
    }
    
    func fetchUserData(uid: String) {
        let userDocRef = db.collection("usuarios").document(uid)
        
        userDocRef.getDocument { document, error in
            if let document = document, document.exists {
                if let data = document.data() {
                    if let nome = data["nome"] as? String,
                       let email = data["email"] as? String,
                       let permissao = data["permissao"] as? Int,
                       let fcmToken = data["fcmToken"] as? String {
                        
                        let fetchedUser = User(uid: uid, nome: nome, email: email, permissao: permissao, fcmToken: fcmToken)
                        self.currentUser = fetchedUser
                        self.userDataLoaded = true
                    }
                }
            } else {
                print("Documento do usuário não encontrado")
            }
        }
    }
    
    func updateUserData(timeacesso: Date) {
        guard let currentUser = currentUser else {
            print("currentUser é nil ao tentar atualizar dados do usuário")
            return
        }
        
        let userDocRef = db.collection("usuarios").document(currentUser.uid)
        userDocRef.updateData(["timeacesso": timeacesso]) { error in
            if let error = error {
                print("Erro ao atualizar dados do usuário: \(error.localizedDescription)")
            } else {
                print("Dados do usuário atualizados com sucesso")
            }
        }
    }
    
    func signOut() {
            do {
                try Auth.auth().signOut()
                currentUser = nil
            } catch {
                print("Erro ao fazer logoff: \(error.localizedDescription)")
            }
        }
}
