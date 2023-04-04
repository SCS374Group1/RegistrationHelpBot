//
//  AdministrationView.swift
//  RegistraionHelpBot
//
//  Created by Austin Patton on 3/20/23.
//
import SwiftUI
import Foundation

//creates array of loaded admin data
let loadedAdminData = ModelData().adminData

//The main menu view of the Chatbot admin page
struct AdministrationManagementView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: RecentFeedback()) {
                        Text("Recent Feedback")
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
        //locks screen into portrait mode; done for security purposes
            .onAppear{
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
    }
}

struct AdministrationManagementView_Previews: PreviewProvider {
    static var previews: some View {
        AdministrationManagementView()
    }
}
