//
//  HelpDesk.swift
//  HelpDesk
//
//  Created by Joao Rocha on 01/08/24.
//

import Foundation

 public struct HelpDesk: Codable, Equatable, Hashable {
     let id: String?
     let uid: String
     let help: HelpRoot
 }

 public struct HelpRoot: Codable, Equatable, Hashable {
     let solicitante: String
     let titulo: String
     let texto: String
     let departamento: String
     let prioridade: String
     let solucionado: Bool
 }
