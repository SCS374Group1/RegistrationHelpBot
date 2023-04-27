//
//  PastIssueLog.swift
//  RegistraionHelpBot
//
//  Created by Shane Simpson on 4/19/23.
//

import SwiftUI

    //past issue array
    public var pastIssueLog : [String] = []


struct PastIssueLog: View {
    //variable to enable dismiss action, used for custom back arrow
    @Environment(\.dismiss) private var dismiss
    
    //state variable to hold the messages
    @State private var messages = ""

    var body: some View {
        
        //reads in values from past issue log array into the list
        List(pastIssueLog, id: \.self) { string in
            HStack{
                //text for the past issue log
                Text(string)
            }
            
            
        }.onAppear{
            //enables device to be rotated without allowing access to other screens by "locking" it into portrait mode
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }//hides default back button; for security purposes
        .navigationBarBackButtonHidden(true)
        //adds customized back button to toolbar
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    //sends user back to screen they were previously on, in this case the AdvisorStudentListView
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Feedback Menu")
                    }
                }
            }
        }
    }
}

struct PastIssueLog_Previews: PreviewProvider {
    static var previews: some View {
        PastIssueLog()
    }
}
