//
//  SettingsMenuView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/15/23.
//

import SwiftUI

var isSwitchOn: Bool = true

struct SettingsMenuView: View {
    @AppStorage ("toggleNotifications") private var toggleNotifications = false
    @AppStorage ("toggleDarkMode") var toggleDarkMode = false
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
                    Toggle("Dark Mode", isOn: $toggleDarkMode)
                    
                }
                Section(header: Text("Notifications")) {
                    Toggle("Notifications", isOn: $toggleNotifications)
                }
                Section(header: Text("Text Bubble Background")) {
                    List {
                        VStack {
                            Toggle("Camo", isOn: $toggleBubbleColor1)
                                .background(Image("camo").resizable().frame(width: 60))
                            if toggleBubbleColor1 {
                                let backgroundColor = Image("camo")
                            }
                        }
                        VStack {
                            Toggle("Tree", isOn: $toggleBubbleColor2)
                                .background(Image("tree").resizable().frame(width: 60))
                            if toggleBubbleColor2 {
                                let backgroundColor = Image("tree")
                            }
                        }
                        VStack {
                            Toggle("Naruto", isOn: $toggleBubbleColor3)
                                .background(Image("naruto").resizable().frame(width: 60))
                            if toggleBubbleColor3 {
                                let backgroundColor = Image("naruto")
                            }
                        }
                        VStack {
                            Toggle("Cyber", isOn: $toggleBubbleColor4)
                                .background(Image("cyber").resizable().frame(width: 60))
                            if toggleBubbleColor4 {
                                let backgroundColor = Image("cyber")
                            }
                        }
                        VStack {
                            Toggle("Yellow", isOn: $toggleBubbleColor5)
                                .background(Image("yellow").resizable().frame(width: 60))
                            if toggleBubbleColor5 {
                                let backgroundColor = Image("yellow")
                            }
                        }
                        VStack {
                            Toggle("Red", isOn: $toggleBubbleColor6)
                                .background(Image("red").resizable().frame(width: 60))
                            if toggleBubbleColor6 {
                                let backgroundColor = Image("red")
                            }
                        }
                        VStack {
                            Toggle("Green", isOn: $toggleBubbleColor7)
                                .background(Image("green").resizable().frame(width: 60))
                            if toggleBubbleColor7 {
                                let backgroundColor = Image("green")
                            }
                        }
                        VStack {
                            Toggle("Cyan", isOn: $toggleBubbleColor8)
                                .background(Image("cyan").resizable().frame(width: 60))
                            if toggleBubbleColor8 {
                                let backgroundColor = Image("cyan")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsMenuView_Previews: PreviewProvider {
    static var previews: some View{
        SettingsMenuView()
    }
}
