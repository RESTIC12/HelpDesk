//
//  HelpServiceTestUseCases.swift
//  HelpDeskTests
//
//  Created by Joao Rocha on 25/07/24.
//

import XCTest
@testable import HelpDesk

final class HelpServiceTestUseCases: XCTestCase {

    func test_initializer_service_and_validate_urlRequest() {
        let spy = NetworkClientSpy()
        let anyUrl = URL(string: "https://localhost:3000/")!
        let sut = HelpServiceImp(networkClient: spy, fromUrl: anyUrl)
        
        sut.load { _ in }
        
        XCTAssertEqual(spy.urlRequest, [anyUrl])
    }

}

final class NetworkClientSpy: NetworkClient {

    var urlRequest = [URL]()

    func request(from url: URL,
                 completion: @escaping (NetworkResult) -> Void) {
        urlRequest.append(url)
    }

}
