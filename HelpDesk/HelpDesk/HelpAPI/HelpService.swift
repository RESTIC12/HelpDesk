//
//  HelpService.swift
//  HelpDesk
//
//  Created by Joao Rocha on 25/07/24.
//

import Foundation

public enum HelpDeskResultError: Swift.Error {
    case withoutConnectivity
    case invalidData
}

public protocol HelpService {
    typealias HelpResult = Result<[HelpDesk], HelpDeskResultError>
    func load(filterUser: String?, completion: @escaping (HelpResult) -> Void)
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
    
    public func load(filterUser: String? = nil, completion: @escaping (HelpService.HelpResult) -> Void) {
        if let param = filterUser {
            fromUrl = URL(string: "\(fromUrl)?uid_eq=\(filterUser)")!
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

    // TODO: Mudar o permissao para usuário
    public func loadDepartament(permissao: String, completion: @escaping (HelpService.HelpResult) -> Void) {
        switch permissao {
        case "ti":
            fromUrl = URL(string: "\(fromUrl)?help.departamento_eq=0")!
        case "rh":
            fromUrl = URL(string: "\(fromUrl)?help.departamento_eq=1")!
        default:
            fromUrl = URL(string: "\(fromUrl)?uid_eq={UID_USUARIO})")!
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

    public func createHelp(_ call: HelpDesk) {
        let help: [String: Any] = [
            "titulo": call.help.titulo,
            "texto": call.help.texto,
            "patrimonio": call.help.patrimonio,
            "departamento": call.help.departamento,
            "prioridade": call.help.prioridade,
            "solucionado": call.help.solucionado
        ]
        let itemJson: [String: Any] = [
            "uid": call.uid,
            "help": help
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: itemJson)
        let url = URL(string: "http://localhost:3000/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
            }
        }.resume()
    }
    
    public func updateHelp(_ call: HelpDesk) {
        let help: [String: Any] = [
            "titulo": call.help.titulo,
            "texto": call.help.texto,
            "patrimonio": call.help.patrimonio,
            "departamento": call.help.departamento,
            "prioridade": call.help.prioridade,
            "solucionado": call.help.solucionado
        ]
        let itemJson: [String: Any] = [
            "id": call.id,
            "uid": call.uid,
            "help": help
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: itemJson)
        let url = URL(string: "http://localhost:3000/")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("-----> data: \(data)")
            print("-----> error: \(error)")
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print("-----1> responseJSON: \(responseJSON)")
            if let responseJSON = responseJSON as? [String: Any] {
                print("-----2> responseJSON: \(responseJSON)")
            }
        }.resume()
    }
    
}
