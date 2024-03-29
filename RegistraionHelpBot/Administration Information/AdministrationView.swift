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
                // creates a link to a recent feedback page
                    NavigationLink(destination: RecentFeedback()) {
                        Text("Recent Feedback")
                    }
                }
               
                Section {
                    // creates a link to a needs attention page
                    NavigationLink(destination: NeedsAttention()) {
                        Text("Needs Attention")
                    }
                }
                //button to go to the past issue logs
                Section {
                    NavigationLink(destination: PastIssueLog()) {
                        Text("Past Issue Log")
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

struct AdministrationManagementView_Previews: PreviewProvider {
    static var previews: some View {
        AdministrationManagementView()
    }
}
