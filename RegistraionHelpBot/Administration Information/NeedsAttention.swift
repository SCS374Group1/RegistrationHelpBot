//
//  NeedsAttention.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 4/12/23.
//

import SwiftUI

struct NeedsAttention: View {
    @State private var messages = ""
    //variable to enable dismiss action, used for custom back arrow
    @Environment(\.dismiss) private var dismiss
    
    //state variable to hold the needs attention text
    @State var needsAttentionText = ""
    
    var body: some View {
        List {
            HStack{
                //text for the issue at hand
                Text(needsAttentionText)
                //spacer to push button to right side of hstack
                Spacer().padding(10)
                //
                Button("Mark as Done"){
                    print("PRESSED!")
                    //defines issue log text file
                    let file = "pastIssueLogs.txt"

                    //creates the message to be saved
                    let writeText = needsAttentionText
                    
                    //checks for issue log file and writes to it if the file is found
                    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                        //establishes file URL
                        let fileURL = dir.appendingPathComponent(file)

                        //attempts writing to file
                        do {
                            try writeText.write(to: fileURL, atomically: false, encoding: .utf8)
                        }
                        //if a failure occurs, the error message is printed
                        catch {print("ERROR TRYING TO WRITE TO PAST ISSUE LOG FILE.")}
                    }
                    //resets the text to be blank
                    needsAttentionText = ""
                }
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
        //updates needs attention text when the list loads
        }
        .onAppear(){
            //enables device to be rotated without allowing access to other screens by "locking" it into portrait mode
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            //sets needs attention text variable
            needsAttentionText = getRecentFeedback(inputText3: messages, fileToRetrieve: "needsAttention.txt")
            //cleans file so that the same issue is not constantly repopulated to the needs attention menu
            let file = "needsAttention.txt"
            //checks for needs attention file and writes to it if the file is found
            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                
                //establishes file URL
                let fileURL = dir.appendingPathComponent(file)
                //creatse cleanup text
                let cleanupText = ""
                
                //attempts writing to file
                do {
                    try cleanupText.write(to: fileURL, atomically: false, encoding: .utf8)
                }
                //if a failure occurs, the error message is printed
                catch {print("ERROR TRYING TO WRITE TO NEEDS ATTENTION FILE.")}
            }
        }
    }
}


struct NeedsAttention_Previews: PreviewProvider {
    static var previews: some View {
        NeedsAttention()
    }
}
