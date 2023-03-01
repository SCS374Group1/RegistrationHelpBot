//
//  MainMenuView.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import SwiftUI
//The main menu view of the Chatbot
struct MainMenuView: View {
    //variable to hold botIcon Image
    let botIcon = Image("Outlined RegistrationHelpbot Icon")
    var body: some View {
        NavigationView {
            VStack {
                //title text
                Text("Registration Helpbot")
                    .font(.largeTitle)
                    .monospaced()
                    .multilineTextAlignment(.center)
                //app logo
                botIcon
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding([.bottom],100)
                //Login button
                            NavigationLink(destination: ChatbotView()){
                                Text("Login Student View")
                            }.frame(width: 100, height: 100)
                                .font(.body)
                                .foregroundColor(Color.white)
                                .background(Color.gray)
                                .cornerRadius(10)
                            
                            NavigationLink(destination: AdvisorStudentListView()){
                                Text("Login Advisor View")
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


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .systemRed
        view.backgroundColor = CustomColor.customBackgroundColor
    }
}
