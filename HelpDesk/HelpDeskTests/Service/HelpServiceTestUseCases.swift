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
        
        assert(sut, completion: .failure(.withoutConnectivity)) {
            spy.completionRequestWithError()
        }
    }
    
    func test_service_returned_error_for_invalid_data() {
        let (sut, spy, _) = makeSUT()
        
        assert(sut, completion: .failure(.invalidData)) {
            spy.completionRequestWithSuccess()
        }
    }

    func test_service_and_returned_success_with_help_list() throws {
        let (sut, spy, _) = makeSUT()
        let (model, json) = makeHelp()
        let (model2, json2) = makeHelp()
        
        assert(sut, completion: .success([model, model2])) {
            let jsonItems = [json, json2]
            let data = try! JSONSerialization.data(withJSONObject: jsonItems)
            spy.completionRequestWithSuccess(data: data)
        }
    }

    private func makeHelp(
        id: String = "id_user",
        uid: String = "user_token",
        titulo: String = "Title",
        texto: String = "Texto",
        patrimonio: String = "MAC-040",
        departamento: Int = 0,
        prioridade: Int = 1,
        solucionado: Bool = false
    ) -> (model: HelpDesk, json: [String: Any]){
        let model = HelpDesk(
            id: id,
            uid: uid,
            help: HelpRoot(
                titulo: titulo,
                texto: texto,
                patrimonio: patrimonio,
                departamento: Departamento(rawValue: departamento)!,
                prioridade: Prioridade(rawValue: prioridade)!,
                solucionado: solucionado
            )
        )
        let help: [String: Any] = [
            "titulo": titulo,
            "texto": texto,
            "patrimonio": patrimonio,
            "departamento": departamento,
            "prioridade": prioridade,
            "solucionado": solucionado
        ]
        let itemJson: [String: Any] = [
            "id": id,
            "uid": uid,
            "help": help
        ]
        return (model, itemJson)
    }

    private func assert(
        _ sut: HelpServiceImp,
        completion result: Result<[HelpDesk], HelpDeskResultError>?,
        when action: () -> Void,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let exp = expectation(description: "waiting")
        var returnedResult: Result<[HelpDesk], HelpDeskResultError>??
        sut.load { result in
            returnedResult = result
            exp.fulfill()
        }
        
        action()
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(returnedResult, result)
    }

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (HelpServiceImp, NetworkClientSpy, URL) {
        let spy = NetworkClientSpy()
        let anyUrl = URL(string: "https://localhost:3000/")!
        let sut = HelpServiceImp(networkClient: spy, fromUrl: anyUrl)
        return (sut, spy, anyUrl)
    }
    
    private func emptyData() -> Data {
        return Data("{ [] }".utf8)
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
