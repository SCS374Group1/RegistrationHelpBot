//
//  AcademicProfile.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 4/18/23.
//

import SwiftUI

//The main menu view of the Chatbot
struct AcademicProfile: View {
    var body: some View {
        //Displays a list of a students academic profile information
        List {
            VStack(alignment: .center) {
                HStack {
                    //displays a studnets name
                    Text(loadedStudentData[studentArrayIDNumber].name)
                    Spacer()
                }
                HStack{
                    //displays a studnets grade
                    Text(loadedStudentData[studentArrayIDNumber].grade)
                    Spacer()
                }
                HStack{
                    //displays a students gpa
                    Text(String(loadedStudentData[studentArrayIDNumber].gpa) + " GPA")
                    Spacer()
                }
                HStack{
                    //displays a studnets credits
                    Text(String(loadedStudentData[studentArrayIDNumber].credits) + " credits")
                    Spacer()
                }
                HStack{
                    //displays a course that a student needs to take
                    Text(String(loadedStudentData[studentArrayIDNumber].course1))
                    Spacer()
                }
                HStack{
                    //displays a course that a student needs to take
                    Text(String(loadedStudentData[studentArrayIDNumber].course2))
                    Spacer()
                }
                HStack{
                    //displays a course that a student needs to take
                    Text(String(loadedStudentData[studentArrayIDNumber].course3))
                    Spacer()
                }
                HStack{
                    //displays a students univiristy 
                    Text(String(loadedStudentData[studentArrayIDNumber].university))
                    Spacer()
                }
            }
        }
    }
}

struct AcademicProfile_Previews: PreviewProvider {
    static var previews: some View {
        AcademicProfile()
    }
}
