//
//  AdvisorStudentListView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/1/23.
//

import SwiftUI
//The main menu view of the Chatbot
struct AdvisorStudentListView: View {
    //variable to hold botIcon Image
    let botIcon = Image("RegistrationHelpbot Icon")
    struct Student: Hashable, Identifiable {
            let name: String
            let id = UUID()
        }

        struct StudentClass: Identifiable {
            let name: String
            let students: [Student]
            let id = UUID()
        }

        private let studentClass: [StudentClass] = [
            StudentClass(name: "Freshman",
                        students: [Student(name: "Student 1"),
                               Student(name: "Student 2"),
                               Student(name: "Student 3"),
                               Student(name: "Student 4")]),
            StudentClass(name: "Sophmore",
                        students: [Student(name: "Student 1"),
                               Student(name: "Student 2"),
                               Student(name: "Student 3"),
                               Student(name: "Student 4")]),
            StudentClass(name: "Junior",
                        students: [Student(name: "Student 1"),
                               Student(name: "Student 2"),
                               Student(name: "Student 3"),
                               Student(name: "Student 4")]),
            StudentClass(name: "Senior",
                        students: [Student(name: "Student 1"),
                               Student(name: "Student 2"),
                               Student(name: "Student 3"),
                               Student(name: "Student 4")])
        ]

        @State private var singleSelection: UUID?

    var body: some View {

            NavigationView {
                NavigationLink(destination: AdvisorChatView()) {
                    List(selection: $singleSelection) {
                        ForEach(studentClass) { advise in
                            Section(header: Text("Student Class is \(advise.name)")) {
                                ForEach(advise.students) { student in
                                    Text(student.name)
                                }
                            }
                        }
                        .navigationTitle("Student List")
                    }
                }
        }
    }
}

struct AdvisorStudentListView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisorStudentListView()
    }
}
