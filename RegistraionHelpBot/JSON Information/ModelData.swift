//
//  ModelData.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/14/23.
//  Refactored by Shane Simpson on 3/18/23.
//  Refactored by Austin Patton 3/20/23
//

import Foundation
public class ModelData{
    
    //creates array to hold Advisor objects created from advisorInformation.json file
    @Published var advisorData = [Advisor]()
    //creates array to hold Student objects created from studentInformation.json file
    @Published var studentData = [Student]()
    //creates array to hold Admin objects
    @Published var adminData = [Admin]()
    
    //initializer that loads the data from the json files (advisorInformation, studentInformation, and adminInformation) and sorts each object by their ID number
    init(){
        load()
        sort()
    }
    //loads data from JSON into objects
    func load(){
        //LOADING FOR ADVISOR FILE
        //tries to open advisorInformation.json file
        if let fileLocation = Bundle.main.url(forResource: "advisorInformation", withExtension: "json"){
           
            //attempts to load data from file; catches errors if they arise
            do{
                //fetches data from JSON
                let data = try Data(contentsOf: fileLocation)
                //decoder to decode JSON data
                let jsonDecoder = JSONDecoder()
                //holds decoded data from JSON and creates an array of Advisor objects
                let dataFromJSON = try jsonDecoder.decode([Advisor].self, from: data)
                self.advisorData = dataFromJSON
            }catch{
                print(error)
            }
        }
        
        //LOADING FOR STUDENT FILE
        //tries to open studentInformation.json file
        if let fileLocation = Bundle.main.url(forResource: "studentInformation", withExtension: "json"){
           
            //attempts to load data from file; catches errors if they arise
            do{
                //fetches data from JSON
                let data = try Data(contentsOf: fileLocation)
                //decoder to decode JSON data
                let jsonDecoder = JSONDecoder()
                //holds decoded data from JSON and creates an array of Advisor objects
                let dataFromJSON = try jsonDecoder.decode([Student].self, from: data)
                self.studentData = dataFromJSON
            }catch{
                print(error)
            }
        }
        //LOADING FOR ADMIN FILE
        //tries to open admin file
        if let fileLocation = Bundle.main.url(forResource: "adminInformation", withExtension: "json"){
           
            //attempts to load data from file; catches errors if they arise
            do{
                //fetches data from JSON
                let data = try Data(contentsOf: fileLocation)
                //decoder to decode JSON data
                let jsonDecoder = JSONDecoder()
                //holds decoded data from JSON and creates an array of Advisor objects
                let dataFromJSON = try jsonDecoder.decode([Admin].self, from: data)
                self.adminData = dataFromJSON
            }catch{
                print(error)
            }
        }
        
        
        
    }
    
    //sorts JSON data in all JSON object arrays (student, advisor, admin) based on ID field
    func sort(){
        self.advisorData = self.advisorData.sorted(by: {$0.advisorID < $1.advisorID})
        self.studentData = self.studentData.sorted(by: {$0.studentID < $1.studentID})
        self.adminData = self.adminData.sorted(by: {$0.adminID < $1.adminID})
    }
}
