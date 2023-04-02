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
                        VStack {
                            Toggle("Cyan", isOn: $toggleBubbleColor8)
                                .background(Image("cyan").resizable().frame(width: 60).opacity(0.8))
                        }
                        VStack {
                            Toggle("Green", isOn: $toggleBubbleColor7)
                                .background(Image("green").resizable().frame(width: 60).opacity(0.8))
                        }
                        VStack {
                            Toggle("Red", isOn: $toggleBubbleColor6)
                                .background(Image("red").resizable().frame(width: 60).opacity(0.75))
                        }
                        VStack {
                            Toggle("Yellow", isOn: $toggleBubbleColor5)
                                .background(Image("yellow").resizable().frame(width: 60))
                        }
                        VStack {
                            Toggle("Cyber", isOn: $toggleBubbleColor4)
                                .background(Image("cyber").resizable().frame(width: 60))
                        }
                        VStack {
                            Toggle("Desert", isOn: $toggleBubbleColor3)
                                .background(Image("sand").resizable().frame(width: 60))
                        }
                        VStack {
                            Toggle("Forest", isOn: $toggleBubbleColor2)
                                .background(Image("tree").resizable().frame(width: 60))
                        }
                        VStack {
                            Toggle("Ocean", isOn: $toggleBubbleColor1)
                                .background(Image("sea").resizable().frame(width: 60))
                        }
                    }
                }
                //logout section
                Section(header: Text("Logout")) {
                    //sends user back to main menu as a logout
                    NavigationLink("Logout", destination: MainMenuView())
                }
            }
            //implements custom back button that sends user back to the previous screen, either the student or advisor Chatbot view
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
            //hides default back button
        }.navigationBarBackButtonHidden(true)
        //locks screen into portrait mode
            .onAppear{
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
    }
}

struct SettingsMenuView_Previews: PreviewProvider {
    static var previews: some View{
        SettingsMenuView()
    }
}
