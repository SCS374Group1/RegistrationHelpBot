//
//  Advisors.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/14/23.
//

import Foundation

struct Advisor: Codable {
    //id number for the advisors
    var advisorID : Int
    var name: String
    var username: String
    var password: String
    //university variable for the advisors
    var university : String
}
