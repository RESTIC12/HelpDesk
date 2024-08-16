//
//  User.swift
//  HelpDesk
//
//  Created by Victor Brigido on 25/07/24.
//

import Foundation

struct User: Codable, Equatable {
    let uid: String
    let nome: String
    let email: String
    let permissao: Int
}
