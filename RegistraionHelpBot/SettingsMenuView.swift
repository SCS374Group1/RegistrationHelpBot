//
//  SettingsMenuView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/15/23.
//

import SwiftUI

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
                Section(header: Text("Notifications")) {
                    Toggle("Notifications", isOn: $toggleNotifications)
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
