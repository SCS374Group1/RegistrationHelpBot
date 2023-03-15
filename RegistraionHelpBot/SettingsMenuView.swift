//
//  SettingsMenuView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/15/23.
//

import SwiftUI

struct SettingsMenuView: View {
    @State private var toggleDarkMode = true
    @State private var toggleNotifications = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Display")) {
                    Toggle("Dark Mode", isOn: $toggleDarkMode)
                    
                }
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $toggleNotifications,
                           label: {
                        Text("Notifications")
                    })
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
