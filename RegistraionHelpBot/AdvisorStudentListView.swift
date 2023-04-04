//
//  AdvisorStudentListView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/1/23.
//

import SwiftUI
//creates array of loaded student data
let loadedStudentData = ModelData().studentData

//The main menu view of the Chatbot
struct AdvisorStudentListView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: AdvisorChatView()){
                List(loadedStudentData) { Student in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(Student.name)
                        }
                        HStack{
                            Text(Student.grade)
                        }
                        HStack{
                            Text(String(Student.gpa) + " GPA")
                        }
                        HStack{
                            Text(String(Student.credits) + " credits")
                        }
                    }
                }
            }
            //removes default back button; for security purposes
        }.navigationBarBackButtonHidden(true)
        //locks screen into portrait mode; for security purposes
            .onAppear{
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
    }
}

struct AdvisorStudentListView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisorStudentListView()
    }
}
