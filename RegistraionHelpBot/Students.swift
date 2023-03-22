//
//  Studnets.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/14/23.
//

import Foundation

struct Student: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case studentID
        case gpa
        case credits
        case name
        case grade
        case username
        case password
        case hasAccountHolds
    }
    var id = UUID()
    var studentID : Int
    var gpa : Float
    var credits : Int
    var name : String
    var grade : String
    var username : String
     var password : String
    var hasAccountHolds : Bool

}
