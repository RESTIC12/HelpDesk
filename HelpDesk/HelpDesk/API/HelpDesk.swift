//
//  HelpDesk.swift
//  HelpDesk
//
//  Created by Joao Rocha on 01/08/24.
//

import Foundation

// public struct HelpDesk: Codable, Equatable, Hashable {
//     let id: String?
//     let uid: String
//     let details: HelpRoot
// }
//
//public struct HelpRoot: Codable, Equatable, Hashable {
//    let solicitante: String
//    let titulo: String
//    let texto: String
//    let departamento: String
//    let prioridade: String
//    var solucionado: Bool
//}

import FirebaseFirestoreSwift

public struct HelpDesk: Codable, Equatable, Hashable, Identifiable {
    @DocumentID public var id: String?
    let uid: String?
    let details: HelpRoot
}

public struct HelpRoot: Codable, Equatable, Hashable {
    let solicitante: String
    let titulo: String
    let texto: String
    let departamento: String
    let prioridade: String
    var solucionado: Bool
}

