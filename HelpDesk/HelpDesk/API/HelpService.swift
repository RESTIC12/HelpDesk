//
//  HelpService.swift
//  HelpDesk
//
//  Created by Joao Rocha on 01/08/24.
//

import Foundation
import FirebaseFirestore

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
                    try? document.data(as: HelpDesk.self)
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
                    completion(true)
                }
            })
        } catch let error {
            print("Error serializing data: \(error)")
            completion(false)
        }
    }
}


// public final class HelpServiceImp: HelpService {
//     let networkClient: NetworkClient
//     var fromUrl: URL = URL(string:"http:localhost:3000/help")!
//     let okResponse: Int = 200
//
//     public init(networkClient: NetworkClient, fromUrl: URL) {
//         self.networkClient = networkClient
//         self.fromUrl = fromUrl
//     }
//
//     private func successfullyValidation(_ data: Data, response: HTTPURLResponse) -> HelpService.HelpResult {
//         guard let json = try? JSONDecoder().decode([HelpDesk].self, from: data),
//               response.statusCode == okResponse else {
//             return .failure(.invalidData)
//         }
//         return .success(json)
//     }
//
//     public func load(completion: @escaping (HelpService.HelpResult) -> Void) {
//         fromUrl = URL(string:"http://localhost:3000/help")!
//         let uid = SessionManager.shared.currentUser?.uid
//         switch SessionManager.shared.currentUser?.permissao {
//         case 0:
//             fromUrl = URL(string: "\(fromUrl)?uid_eq=\(uid!)")!
//         case 1:
//             fromUrl = URL(string: "\(fromUrl)?details.departamento_eq=TI")!
//         case 2:
//             fromUrl = URL(string: "\(fromUrl)?details.departamento_eq=RH")!
//         default:
//             fromUrl = URL(string: "\(fromUrl)")!
//         }
//         networkClient.request(from: fromUrl) { [weak self] result in
//             guard let self else { return }
//             switch result {
//             case let .success((data, response)):
//                 completion(self.successfullyValidation(data, response: response))
//             case .failure:
//                 completion(.failure(.withoutConnectivity))
//             }
//         }
//     }
//
//     func serializeHelpDesk(helpDesk: HelpDesk) -> Data? {
//         let encoder = JSONEncoder()
//         encoder.outputFormatting = .prettyPrinted
//
//         do {
//             let jsonData = try encoder.encode(helpDesk)
//             return jsonData
//         } catch {
//             print("Erro ao serializar JSON: \(error.localizedDescription)")
//         }
//         return nil
//     }
//
//     public func createHelp(_ call: HelpDesk, method: String = "POST", completion: @escaping (Bool) -> Void) {
//         guard let jsonData = serializeHelpDesk(helpDesk: call) else {
//             print("Erro ao serializar HelpDesk.")
//             return
//         }
//         var url = URL(string: "http://localhost:3000/help")!
//         if method == "PUT" {
//             url = URL(string: "\(url)/\(call.id ?? "")")!
//         }
//         var request = URLRequest(url: url)
//         request.httpMethod = method
//         request.setValue("\(String(describing: jsonData.count))", forHTTPHeaderField: "Content-Length")
//         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//         request.httpBody = jsonData
//         
//         URLSession.shared.dataTask(with: request) { data, response, error in
//             guard let data = data,
//                   let response = response as? HTTPURLResponse,
//                   error == nil else {
//                 print(error?.localizedDescription ?? "No data")
//                 return
//             }
//             let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//             print("-----> responseJSON: \(responseJSON)\n")
//             if let responseJSON = responseJSON as? [String: Any] {
//                 print("-----> responseJSON: \(responseJSON)")
//             }
//             if response.statusCode == 201 || response.statusCode == 200 {
//                 completion(true)
//                 return
//             }
//             completion(false)
//         }.resume()
//     }
//
// }


