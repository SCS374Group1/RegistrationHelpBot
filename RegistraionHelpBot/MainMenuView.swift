//
//  MainMenuView.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import SwiftUI
//The main menu view of the Chatbot
struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack {
    //Login button
                NavigationLink(destination: ChatbotView()){
                    Text("Login")
                }.frame(width: 100, height: 100)
                    .font(.body)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
        }
    }
}


struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

