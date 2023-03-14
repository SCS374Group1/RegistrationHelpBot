//
//  Advisors.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/14/23.
//

import Foundation

struct Advisors: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case username
        case password
    }

    var id = UUID()
    var name: String
    var username: String
    var password: String
}
