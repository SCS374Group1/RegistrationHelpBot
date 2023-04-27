//
//  MainMenuView.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import SwiftUI

//The main menu view of the Chatbot
struct MainMenuView: View {
    //variable to hold whether dark mode is on or off
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    //variable to hold university selection information
   @State var universitySelection = "Select Your University"
    
    //variables to hold username and password for comparison
    @State private var username = ""
    @State private var password = ""
    //variables to hold student, advisor, and admin data pulled using ModelData file from the corresponding JSON files
    let loadedAdvisorData = ModelData().advisorData
    let loadedStudentData = ModelData().studentData
    let loadedAdminData = ModelData().adminData
    
    //variables to hold info about dynamic borders; highlights the username and password fields in red if incorrect credentials are provided
    @State private var defaultInputBorders = 2
    @State private var wrongCredentials = 0
    //variables to determine which screen should be displayed following a successful login
        //showingStudentLoginScreen sends user to ChatbotView
    @State private var showingStudentLoginScreen = false
        //showingAdvisorLoginScreen sends users to AdvisorStudentListView
    @State private var showingAdvisorLoginScreen = false
        //showingAdminLoginScreen sends users to RecentFeedback
    @State private var showingAdminLoginScreen = false
    //variable to hold botIcon Image
    let botIcon = Image("Outlined RegistrationHelpbot Icon")
    var body: some View {
        NavigationView {
                    //ZStack holds the background elements as well as the actual app items
            ZStack{
            //background circles for decorative purposes
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
                //as the bot icon loads, any feedback messages are loaded in (simulates loading from database upon opening application)
                    .onAppear(){
                        var temp = getFeedbackMessages()
                    }
                //login text to prompt user to login
                Text("Login").font(.largeTitle)
                    .bold()
                    .padding()
                    .monospaced()
                //menu to hold university options for user to select to log in
                //when an option is selected, the universitySelection variable is changed to be that university's name
                Menu(universitySelection) {
                    //university of pittsburgh
                    Button("University of Pittsburgh"){
                        universitySelection = "University of Pittsburgh"
                    }
                    //st vincent college
                    Button("St. Vincent College"){
                        universitySelection = "St. Vincent College"
                    }
                    //slippery rock
                    Button("Slippery Rock University"){
                        universitySelection = "Slippery Rock University"
                    }
                    //seton hill university
                    Button("Seton Hill University"){
                        universitySelection = "Seton Hill University"
                    }
                    //point park university
                    Button("Point Park University"){
                        universitySelection = "Point Park University"
                    }
                    //penn state university
                    Button("Penn State University"){
                        universitySelection = "Penn State University"
                    }
                    //duquesne university
                    Button("Duquesne University"){
                        universitySelection = "Duquesne University"
                    }
                    //carnegie melon university
                    Button("Carnegie Melon University"){
                        universitySelection = "Carnegie Melon University"
                    }
                    //carlow university
                    Button("Carlow University"){
                        universitySelection = "Carlow University"
                    }
                    //california university
                    Button("California University"){
                        universitySelection = "California University"
                    }
                    
                }
                //textfield to obtain user's username; becomes red when invalid information is entered
                TextField("Username", text: $username)
                    .autocapitalization(.none)
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
                //login button that calls the authenticateUser function in this file, which authenticates an inputted username and password against data pulled from the JSON files, simulatign a proper login
                Button("Login"){
                    authenticateUser(username: username,password: password)
                }.foregroundColor(Color.white)
                    .frame(width:200, height:50)
                    .background(Color.blue)
                    .cornerRadius(10)
                //NavigationLink to go to Student view if the login was a student login; goes to ChatbotView
                NavigationLink(destination: ChatbotView(), isActive: $showingStudentLoginScreen){
                    //hides back arrow so that users do not simply go back to the main screen, but have to log out first
                }.navigationBarBackButtonHidden(true)
                //NavigationLink to go to Advisor view if the login was an advisor login; goes to AdvisorStudentListView
                NavigationLink(destination: AdvisorStudentListView(), isActive: $showingAdvisorLoginScreen){
                    //hides back arrow so that users do not simply go back to the main screen, but have to log out first; goes to RecentFeedback
                }.navigationBarBackButtonHidden(true)
                //NavigationLink to go to Admin view if the login was an admin login
                NavigationLink(destination: AdministrationManagementView(), isActive: $showingAdminLoginScreen){
                    //hides back arrow so that users do not simply go back to the main screen, but have to log out first
                }.navigationBarBackButtonHidden(true)

            }
            .padding([.bottom],160)
        }
                    .navigationBarHidden(true)
            //enables device to be rotated without allowing access to other screens by "locking" it into portrait mode
        }.onAppear{
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            //resets the studentArrayIDNumber to 100 everytime the login screen appears
            studentArrayIDNumber = 100
            //hides default back button; for security purposes
        }.navigationBarBackButtonHidden(true)
        //modifies navigation view so that it does not allow the user to pop up another window with a separate screen on it
            .navigationViewStyle(StackNavigationViewStyle())
        }
    //function to authenticate user based on username/password pairs obtained from JSON files
    func authenticateUser(username: String, password: String){
        //boolean to check for whether a successful authentication occurred or if all username/password have been searcher
        var authSuccessCheck = false
        while(!authSuccessCheck){
            //checks all student username/password pairs plus university selection and compares them to user input; if a match is found, logs user in
            for i in 0...(loadedStudentData.count-1){
                if ((username == loadedStudentData[i].username) && (password == loadedStudentData[i].password) && (universitySelection == loadedStudentData[i].university)){
                    wrongCredentials = 0
                    authSuccessCheck = true
                    //sets the index number of the student object for reference in future queries
                    studentArrayIDNumber = i
                    showingStudentLoginScreen = true
                }
            }
            //checks all advisor username/password pairs plus university selection and compares them to user input; if a match is found, logs user in
            for i in 0...(loadedAdvisorData.count-1){
                if ((username == loadedAdvisorData[i].username) && (password == loadedAdvisorData[i].password) && (universitySelection == loadedAdvisorData[i].university)){
                    wrongCredentials = 0
                    authSuccessCheck = true
                    showingAdvisorLoginScreen = true
                }
            }
            //checks all admin username/password pairs plus university selection and compares them to user input; if a match is found, logs user in
            for i in 0...(loadedAdminData.count-1){
                if ((username == loadedAdminData[i].username) && (password == loadedAdminData[i].password) && (universitySelection == loadedAdminData[i].university)){
                    wrongCredentials = 0
                    authSuccessCheck = true
                    showingAdminLoginScreen = true
                }
            }
            //highlights username and password boxes in red if login was unsuccessful or username/password pairs were mismatched or not found
            if(!authSuccessCheck){
                wrongCredentials = 2
                authSuccessCheck = true
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
        
        //view.backgroundColor = .systemBlack allows the background
        //color to change
        view.backgroundColor = CustomColor.customBackgroundColor
    }
}
