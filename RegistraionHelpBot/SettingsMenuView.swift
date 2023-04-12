//
//  SettingsMenuView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/15/23.
//

import SwiftUI
//imports notification utilities
import UserNotifications

struct SettingsMenuView: View {
    
//variable to enable dismiss action, used for custom back arrow
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage ("toggleNotifications") private var toggleNotifications = false
    @AppStorage ("toggleBubbleColor1") var toggleBubbleColor1 = false
    @AppStorage ("toggleBubbleColor2") var toggleBubbleColor2 = false
    @AppStorage ("toggleBubbleColor3") var toggleBubbleColor3 = false
    @AppStorage ("toggleBubbleColor4") var toggleBubbleColor4 = false
    @AppStorage ("toggleBubbleColor5") var toggleBubbleColor5 = false
    @AppStorage ("toggleBubbleColor6") var toggleBubbleColor6 = false
    @AppStorage ("toggleBubbleColor7") var toggleBubbleColor7 = false
    @AppStorage ("toggleBubbleColor8") var toggleBubbleColor8 = false
    let backgroundColor = Image("blue")
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Display")) {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
                //section for notifications
                Section(header: Text("Notifications")) {
                    //toggle button that toggles whether to enable a notification
                    Toggle("Set Notifications", isOn: $toggleNotifications)
                    //if the menu is loaded and the toggle button is true, clears all notifications and creates a new notification (ensures that a notification is sent and prevents duplicates)
                        .onAppear(){
                            if(toggleNotifications){
                                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                                createNotification()
                            }
                        }
                    //when the toggle is changed, either set a notification or delete a notification (if one was already set)
                        .onChange(of: toggleNotifications) { value in
                            print(value)
                            //if the toggle is on, request permission for the notification if it has not been granted already
                            if(toggleNotifications){
                                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                    if success {
                                        print("Permission to send notifications granted.")
                                    } else if let error = error {
                                        //prints error if permission request encounters an error
                                        print(error.localizedDescription)
                                    }
                                }
                                //creates the notification
                                createNotification()
                            }else {
                                //removes notifications if the toggle is switched off
                                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                                print("Notifcations Removed.");
                            }
                        }
                }
                Section(header: Text("Text Bubble Background")) {
                    List {
                        //toggle button for cyan text bubble color
                        VStack {
                            Toggle("Cyan", isOn: $toggleBubbleColor8)
                                .background(Image("cyan").resizable().frame(width: 60).opacity(0.8))
                        }
                        //toggle button for green text bubble color
                        VStack {
                            Toggle("Green", isOn: $toggleBubbleColor7)
                                .background(Image("green").resizable().frame(width: 60).opacity(0.8))
                        }
                        //toggle button for red text bubble color
                        VStack {
                            Toggle("Red", isOn: $toggleBubbleColor6)
                                .background(Image("red").resizable().frame(width: 60).opacity(0.75))
                        }
                        //toggle button for yellow text bubble color
                        VStack {
                            Toggle("Yellow", isOn: $toggleBubbleColor5)
                                .background(Image("yellow").resizable().frame(width: 60))
                        }
                        //toggle button for cyber text bubble coloration
                        VStack {
                            Toggle("Cyber", isOn: $toggleBubbleColor4)
                                .background(Image("cyber").resizable().frame(width: 60))
                        }
                        //toggle button for desert text bubble coloration
                        VStack {
                            Toggle("Desert", isOn: $toggleBubbleColor3)
                                .background(Image("sand").resizable().frame(width: 60))
                        }
                        //toggle button for forest text bubble coloration
                        VStack {
                            Toggle("Forest", isOn: $toggleBubbleColor2)
                                .background(Image("tree").resizable().frame(width: 60))
                        }
                        //toggle button for ocean text bubble coloration
                        VStack {
                            Toggle("Ocean", isOn: $toggleBubbleColor1)
                                .background(Image("sea").resizable().frame(width: 60))
                        }
                    }
                }
                //logout section of settings menu
                Section(header: Text("Logout")) {
                    //sends user back to MainMenuView as a logout function
                    NavigationLink("Logout", destination: MainMenuView())
                }
            }
            //implements custom back button that sends user back to the previous screen, either ChatbotView for students, AdvisorChatView for Advisors, or RecentFeedback for Administrators
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Chatbot")
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            //enables device to be rotated without allowing access to other screens by "locking" it into portrait mode
        }.onAppear{
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            //hides default back button; for security purposes
        }.navigationBarBackButtonHidden(true)
        //modifies navigation view so that it does not allow the user to pop up another window with a separate screen on it
            .navigationViewStyle(StackNavigationViewStyle())
        }
}

struct SettingsMenuView_Previews: PreviewProvider {
    static var previews: some View{
        SettingsMenuView()
    }
}

//function to create a registration day notification
func createNotification(){
    //creates notification content
    let content = UNMutableNotificationContent()
    content.title = "Your Scheduling Day is Tomorrow!"
    content.subtitle = "Your scheduling day is tomorrow at 6am. Make sure to get up early!"
    content.sound = UNNotificationSound.default
    
    //creates date for notification based on user's grade status
    var dateComponents = DateComponents()
    dateComponents.calendar = Calendar.current
    //does not create notification if the user is an advisor or administrator
    if(studentArrayIDNumber == 100){
        return
    }
    //freshman date
    if(loadedStudentData[studentArrayIDNumber].grade == "Freshman"){
        dateComponents.year = 2023
        dateComponents.month = 4
        dateComponents.day = 20
        dateComponents.hour = 7
        dateComponents.minute = 0
    //sophomore date
    }else if(loadedStudentData[studentArrayIDNumber].grade == "Sophomore"){
        dateComponents.year = 2023
        dateComponents.month = 4
        dateComponents.day = 19
        dateComponents.hour = 7
        dateComponents.minute = 0
    //junior date
    }else if(loadedStudentData[studentArrayIDNumber].grade == "Junior"){
        dateComponents.year = 2023
        dateComponents.month = 4
        dateComponents.day = 18
        dateComponents.hour = 7
        dateComponents.minute = 0
    //senior date
    }else if(loadedStudentData[studentArrayIDNumber].grade == "Senior"){
        dateComponents.year = 2023
        dateComponents.month = 4
        dateComponents.day = 17
        dateComponents.hour = 7
        dateComponents.minute = 0
    //graduate student date
    }else if(loadedStudentData[studentArrayIDNumber].grade == "Graduate"){
        dateComponents.year = 2023
        dateComponents.month = 4
        dateComponents.day = 16
        dateComponents.hour = 7
        dateComponents.minute = 0
    //sends error report to admin if student's information cannot be found
    }else{
       var reportError = sendFeedback(message: "Student " + String(studentArrayIDNumber) + " attempted to create a notification, but their grade level could not be determined.", admin: 1)
        print(reportError)
    }
    
    //creates the trigger for the notification
    let trigger = UNCalendarNotificationTrigger(
             dateMatching: dateComponents, repeats: false)
    
    //creates the notification request to be passed to the system
    let uuidString = UUID().uuidString
    let request = UNNotificationRequest(identifier: uuidString,
                content: content, trigger: trigger)

    //schedules the notification request with the system
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.add(request) { (error) in
       if error != nil {
          print("ERROR CREATING NOTIFICATION")
       }
    }

}
