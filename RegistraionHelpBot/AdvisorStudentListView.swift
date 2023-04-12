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
            //enables device to be rotated without allowing access to other screens by "locking" it into portrait mode
        }.onAppear{
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            //hides default back button; for security purposes
        }.navigationBarBackButtonHidden(true)
        //modifies navigation view so that it does not allow the user to pop up another window with a separate screen on it
            .navigationViewStyle(StackNavigationViewStyle())
        }
}

struct AdvisorStudentListView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisorStudentListView()
    }
}
