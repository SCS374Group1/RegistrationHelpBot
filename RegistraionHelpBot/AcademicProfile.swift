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
        VStack(alignment: .center) {
                    HStack {
                        Text(loadedStudentData[studentArrayIDNumber].name)
                        Spacer()
                    }
                    HStack{
                        Text(loadedStudentData[studentArrayIDNumber].grade)
                        Spacer()
                    }
                    HStack{
                        Text(String(loadedStudentData[studentArrayIDNumber].gpa) + " GPA")
                        Spacer()
                    }
                    HStack{
                        Text(String(loadedStudentData[studentArrayIDNumber].credits) + " credits")
                        Spacer()
                    }
                    HStack{
                        Text(String(loadedStudentData[studentArrayIDNumber].course1))
                        Spacer()
                    }
                    HStack{
                        Text(String(loadedStudentData[studentArrayIDNumber].course2))
                        Spacer()
                    }
                    HStack{
                        Text(String(loadedStudentData[studentArrayIDNumber].course3))
                        Spacer()
                    }
        }
    }
}

struct AcademicProfile_Previews: PreviewProvider {
    static var previews: some View {
        AcademicProfile()
    }
}
