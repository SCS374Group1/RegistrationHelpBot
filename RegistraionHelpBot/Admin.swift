//
//  Admin.swift
//  RegistraionHelpBot
//
//  Created by Austin Patton on 3/20/23.
//

import Foundation
struct Admin: Codable, Identifiable {
    var adminID : Int
    var id: String {String(adminID)}
    var name: String
    var username: String
    var password: String
}
