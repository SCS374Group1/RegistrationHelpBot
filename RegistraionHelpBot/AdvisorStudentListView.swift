//
//  AdvisorStudentListView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/1/23.
//

import SwiftUI
//creates array of loaded student data
let loadedStudentData = ModelData().studentData
//variable to hold the selected student
public var selectedStudent = -1

//The main menu view of the Chatbot
struct AdvisorStudentListView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: AdvisorChatView()){
                List(loadedStudentData) { Student in
                    VStack(alignment: .center) {
                        HStack {
                            Text(Student.name)
                            Spacer()
                        }.border(Color.black.opacity(0.01))
                        HStack{
                            Text(Student.grade)
                            Spacer()
                        }.border(Color.black.opacity(0.01))
                        HStack{
                        Text(String(Student.gpa) + " GPA")
                            Spacer()
                        }.border(Color.black.opacity(0.01))
                       HStack{
                            Text(String(Student.credits) + " credits")
                           Spacer()
                        }.border(Color.black.opacity(0.01))
                        //when a student from the list is selected, logs the student's ID such that messages sent to that student can only be received by that student
                    }.onTapGesture{
                        print("TAP" + String(Student.studentID))
                        selectedStudent = Student.studentID
                        print("TAPSELECTEDSTUDENT " + String(selectedStudent))
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
