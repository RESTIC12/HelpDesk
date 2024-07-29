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
        let (sut, spy, anyUrl) = makeSUT()
        
        sut.load { _ in }
        
        XCTAssertEqual(spy.urlRequest, [anyUrl])
    }

    func test_service_returned_error_for_connectivity() {
        let (sut, spy, _) = makeSUT()
        let exp = expectation(description: "waiting")
        var returnedResult: Result<HelpDesk, HelpDeskResultError>?

        sut.load { result in
            returnedResult = result
            exp.fulfill()
        }
        spy.completionRequestWithError()
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(returnedResult, .failure(.withoutConnectivity))
        
    }
    
    func test_service_returned_error_for_invalid_data() {
        let (sut, spy, _) = makeSUT()
        let exp = expectation(description: "waiting")
        var returnedResult: Result<HelpDesk, HelpDeskResultError>?

        sut.load { result in
            returnedResult = result
            exp.fulfill()
        }
        spy.completionRequestWithSuccess()
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(returnedResult, .failure(.invalidData))
        
    }

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (HelpServiceImp, NetworkClientSpy, URL) {
        let spy = NetworkClientSpy()
        let anyUrl = URL(string: "https://localhost:3000/")!
        let sut = HelpServiceImp(networkClient: spy, fromUrl: anyUrl)
        return (sut, spy, anyUrl)
    }
}

final class NetworkClientSpy: NetworkClient {

    var urlRequest = [URL]()
    private var completionRequestHandler: ((NetworkResult) -> Void)?

    func request(from url: URL,
                 completion: @escaping (NetworkResult) -> Void) {
        urlRequest.append(url)
        completionRequestHandler = completion
    }

    func completionRequestWithSuccess(data: Data = Data(), statusCode: Int = 200) {
        let response = HTTPURLResponse(
            url: urlRequest[0],
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
        completionRequestHandler?(.success((data, response)))
    }

    func completionRequestWithError() {
        completionRequestHandler?(.failure(anyError()))
    }
    
    private func anyError() -> Error {
        return NSError(domain: "anyError", code: -1)
    }

}
