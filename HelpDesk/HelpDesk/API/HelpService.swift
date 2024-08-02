//
//  HelpService.swift
//  HelpDesk
//
//  Created by Joao Rocha on 01/08/24.
//

import Foundation

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
     let networkClient: NetworkClient
     var fromUrl: URL = URL(string:"http:localhost:3000/help")!
     let okResponse: Int = 200

     public init(networkClient: NetworkClient, fromUrl: URL) {
         self.networkClient = networkClient
         self.fromUrl = fromUrl
     }

     private func successfullyValidation(_ data: Data, response: HTTPURLResponse) -> HelpService.HelpResult {
         guard let json = try? JSONDecoder().decode([HelpDesk].self, from: data),
               response.statusCode == okResponse else {
             return .failure(.invalidData)
         }
         return .success(json)
     }

     public func load(completion: @escaping (HelpService.HelpResult) -> Void) {
         switch SessionManager.shared.currentUser?.permissao {
         case 0:
             fromUrl = URL(string: "\(fromUrl)?help.departamento_eq=0")!
         case 1:
             fromUrl = URL(string: "\(fromUrl)?help.departamento_eq=1")!
         default:
//             fromUrl = URL(string: "\(fromUrl)?uid_eq=\(SessionManager.shared.currentUser?.uid ?? "")")!
             fromUrl = URL(string: "\(fromUrl)")!
         }
         networkClient.request(from: fromUrl) { [weak self] result in
             guard let self else { return }
             switch result {
             case let .success((data, response)):
                 completion(self.successfullyValidation(data, response: response))
             case .failure:
                 completion(.failure(.withoutConnectivity))
             }
         }
     }

     func serializeHelpDesk(helpDesk: HelpDesk) -> Data? {
         let encoder = JSONEncoder()
         encoder.outputFormatting = .prettyPrinted

         do {
             let jsonData = try encoder.encode(helpDesk)
             return jsonData
         } catch {
             print("Erro ao serializar JSON: \(error.localizedDescription)")
         }
         return nil
     }

     public func createHelp(_ call: HelpDesk, method: String = "POST", completion: @escaping (Bool) -> Void) {
         guard let jsonData = serializeHelpDesk(helpDesk: call) else {
                print("Erro ao serializar HelpDesk.")
                return
         }
         let url = URL(string: "http://localhost:3000/help")!
         var request = URLRequest(url: url)
         request.httpMethod = method
         request.setValue("\(String(describing: jsonData.count))", forHTTPHeaderField: "Content-Length")
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         request.httpBody = jsonData

         URLSession.shared.dataTask(with: request) { data, response, error in
             guard let data = data,
                   let response = response as? HTTPURLResponse,
                   error == nil else {
                 print(error?.localizedDescription ?? "No data")
                 return
             }
             let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
             print("-----> responseJSON: \(responseJSON)\n")
             if let responseJSON = responseJSON as? [String: Any] {
                 print("-----> responseJSON: \(responseJSON)")
             }
             if response.statusCode == 201 {
                 completion(true)
             } else {
                 completion(false)
             }
         }.resume()
     }

 }
