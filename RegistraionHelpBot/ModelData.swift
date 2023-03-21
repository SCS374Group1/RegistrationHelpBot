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
    
    //creates array to hold Advisor objects
    @Published var advisorData = [Advisor]()
    //creates array to hold Student objects
    @Published var studentData = [Student]()
    //creates array to hold Admin objects
    @Published var adminData = [Admin]()
    
    init(){
        load()
        sort()
    }
    //loads data from JSON into objects
    func load(){
        //LOADING FOR ADVISOR FILE
        //tries to open advisor file
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
        //tries to open student file
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
        //LOADING FOR STUDENT FILE
        //tries to open student file
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
    
    //sorts JSON data based on advisor ID field
    func sort(){
        self.advisorData = self.advisorData.sorted(by: {$0.advisorID < $1.advisorID})
        self.studentData = self.studentData.sorted(by: {$0.studentID < $1.studentID})
    }
}
