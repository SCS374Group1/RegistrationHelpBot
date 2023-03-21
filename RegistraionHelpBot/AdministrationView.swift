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
            NavigationLink(destination: AdvisorChatView()){
                List(loadedAdminData) { Admin in
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Admin ID: " + Admin.id)
                        }
                        HStack{
                            Text("Admin Name: " + Admin.name)
                        }
                        HStack{
                            Text("This is for administration purposes only")
                        }
                        HStack{
                            Text("Updated March, 2023")
                        }
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct AdministrationManagementView_Previews: PreviewProvider {
    static var previews: some View {
        AdministrationManagementView()
    }
}
