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
    func load(completion: @escaping (HelpResult) -> Void)
}

public final class HelpServiceImp: HelpService {

    let networkClient: NetworkClient
    let fromUrl: URL
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

}
