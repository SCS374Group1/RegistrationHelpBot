//
//  RegistrationHelpBotApp.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import SwiftUI
//sets up application as a whole
@main
struct RegistrationHelpBotApp: App {
    //variable to determine whether or not dark mode is on
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    var body: some Scene {
        WindowGroup {
            MainMenuView()
                //makes the app view dark or light mode depending on
                //what the user has toggled
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
