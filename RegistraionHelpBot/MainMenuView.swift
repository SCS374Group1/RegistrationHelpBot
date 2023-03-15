//
//  MainMenuView.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import SwiftUI
//The main menu view of the Chatbot
struct MainMenuView: View {
    //variables to hold username and password for comparison
    @State private var username = ""
    @State private var password = ""
    //variables to hold info about dynamic borders
    @State private var defaultInputBorders = 2
    @State private var wrongCredentials = 0
    //variables to determine which screen should be displayed following a successful login
    @State private var showingStudentLoginScreen = false
    @State private var showingAdvisorLoginScreen = false
    //variable to hold botIcon Image
    let botIcon = Image("Outlined RegistrationHelpbot Icon")
    var body: some View {
        NavigationView {
                    //ZStack holds the background elements as well as the actual app items
            ZStack{
            //background circle
            Circle()
                .scale(2)
                .foregroundColor(.gray.opacity(0.25))
            VStack {
                //title text
                Text("Registration Helpbot")
                    .font(.largeTitle)
                    .monospaced()
                    .multilineTextAlignment(.center)
                //app logo
                botIcon
                    .resizable()
                    .frame(width: 200, height: 200)
                //login text to prompt user to login
                Text("Login").font(.largeTitle)
                    .bold()
                    .padding()
                    .monospaced()
                //textfield to obtain user's username; becomes red when invalid information is entered
                TextField("Username", text: $username)
                    .padding()
                    .frame(width:300, height:50)
                    .background(Color.white.opacity(0.05))
                    .foregroundColor(Color.gray)
                    .cornerRadius(10)
                    .border(.black, width: CGFloat(defaultInputBorders))
                    .border(.red.opacity(0.5), width: CGFloat(wrongCredentials))
                //securefield to obtain user's password; becomes red when invalid information is entered
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width:300, height:50)
                    .background(Color.white.opacity(0.05))
                    .foregroundColor(Color.gray)
                    .cornerRadius(10)
                    .border(.black, width: CGFloat(defaultInputBorders))
                    .border(.red.opacity(0.5), width: CGFloat(wrongCredentials))
                //login button that calls the authenticate function, which authenticates an inputted username and password
                Button("Login"){
                    authenticateUser(username: username,password: password)
                }.foregroundColor(Color.white)
                    .frame(width:200, height:50)
                    .background(Color.blue)
                    .cornerRadius(10)
                //NavigationLink to go to Student view if the login was a student login
                NavigationLink(destination: ChatbotView(), isActive: $showingStudentLoginScreen){
                    //hides back arrow so that users do not simply go back to the main screen, but have to log out first
                }.navigationBarBackButtonHidden(true)
                //NavigationLink to go to Advisor view if the login was an advisor login
                NavigationLink(destination: AdvisorStudentListView(), isActive: $showingAdvisorLoginScreen){
                    //hides back arrow so that users do not simply go back to the main screen, but have to log out first
                }.navigationBarBackButtonHidden(true)

            }
            .padding([.bottom],160)
        }
                    .navigationBarHidden(true)
        }
    }
        func authenticateUser(username: String, password: String){
            if (username == "Student2023"){
                if(password == "studentpassword"){
                    wrongCredentials = 0
                    showingStudentLoginScreen = true
                }else{
                    defaultInputBorders = 0
                    wrongCredentials = 2
                }
            }else if (username == "Advisor2023"){
                if(password == "advisorpassword"){
                    wrongCredentials = 0
                    showingAdvisorLoginScreen = true
                }else{
                    defaultInputBorders = 0
                    wrongCredentials = 2
                }
            }else {
                defaultInputBorders = 0
                wrongCredentials = 2
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
