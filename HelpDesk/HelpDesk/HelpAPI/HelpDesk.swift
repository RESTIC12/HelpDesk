//
//  HelpDesk.swift
//  HelpDesk
//
//  Created by Joao Rocha on 25/07/24.
//

import Foundation

public enum Departamento: Int, Codable {
    case informatica
    case rh
}

public enum Prioridade: Int, Codable {
    case pequena
    case media
    case alta
}

public struct HelpDesk: Codable {
    let uid: String
    let help: HelpRoot
}

public struct HelpRoot: Codable {
    let titulo: String
    let texto: String
    let patrimonio: String
    let departamento: Departamento
    let prioridade: Prioridade
    let solucionado: Bool
}
//{
//    "uid": "usuario_300",
//    "help": {
//        "titulo": "Titulo do Chamado",
//        "texto": "Texto do chamado",
//        "patrimonio": "Notebook Samsung 033",
//        "prioridade": 0,
//        "departamento": 0,
//        "solucionado": 1
//    }
//}
