//
//  HelpDesk.swift
//  HelpDesk
//
//  Created by Joao Rocha on 25/07/24.
//

import Foundation

public enum Departamento: Int, Codable, Equatable {
    case informatica
    case rh
}

public enum Prioridade: Int, Codable, Equatable {
    case pequena
    case media
    case alta
}

public struct HelpDesk: Codable, Equatable {
    let id: String?
    let uid: String
    let help: HelpRoot
}

public struct HelpRoot: Codable, Equatable {
    let solicitante: String
    let titulo: String
    let texto: String
    let patrimonio: String
    let departamento: Departamento
    let prioridade: Prioridade
    let solucionado: Bool
}
