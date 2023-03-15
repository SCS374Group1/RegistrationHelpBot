//
//  AdvisorStudentListView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/1/23.
//

import SwiftUI
//The main menu view of the Chatbot
struct AdvisorStudentListView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: AdvisorChatView()){
                List(students) { student in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(student.name)
                        }
                        HStack{
                            Text(student.grade)
                        }
                        HStack{
                            Text(String(student.gpa) + " GPA")
                        }
                        HStack{
                            Text(String(student.credits) + " credits")
                        }
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct AdvisorStudentListView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisorStudentListView()
    }
}
