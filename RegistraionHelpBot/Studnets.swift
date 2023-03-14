//
//  Studnets.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/14/23.
//

import Foundation

struct Students: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case gpa
        case credits
        case name
        case grade
        case username
        case password
    }

    var id = UUID()
    var gpa: Float
    var credits: Int
    var name: String
    var grade: String
    var username: String
    var password: String
}
