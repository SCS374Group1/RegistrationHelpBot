//
//  NeedsAttention.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 4/12/23.
//  Refactored by Shane Simpson on 4/27/23.
//

import SwiftUI

    //needs attention log array
    public var needsAttentionLog : [String] = []

struct NeedsAttention: View {
    @State private var messages = ""
    //variable to enable dismiss action, used for custom back arrow
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        //reads in items from needs attention log array
        List(needsAttentionLog, id: \.self) { string in
            HStack{
                //text for the issue at hand
                Text(string)
                //spacer to push button to right side of hstack
                Spacer().padding(10)
                //button that sets an issue as done
                Button("Mark as Done"){
                    //variable to store issue
                    let markedText = string
                    //moves item from needs attention log to past issue log
                    for i in 0...(needsAttentionLog.count-1){
                        if(needsAttentionLog[i] == markedText){
                            pastIssueLog.append(needsAttentionLog[i])
            
                            //defines issue log text file
                            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
                                let pastIssueURL = dir.appendingPathComponent("pastIssueLogs.txt")
                                //writes the past issue log to a string variable
                                var pastIssueInputText = ""
                                for i in 0...(pastIssueLog.count-1){
                                    pastIssueInputText.append(pastIssueLog[i])
                                    pastIssueInputText.append("\n")
                                }
                                //writes the past issue string to file
                                do{
                                    try pastIssueInputText.write(to: pastIssueURL, atomically: false, encoding: .utf8)
                                }
                                catch{
                                    print("ERROR WRITING TO PAST ISSUE FILE")
                                }
                            }
                            //removes the item form the needs attention log
                            needsAttentionLog.remove(at: i)
                            //removes any blank items from past issue log
                            pastIssueLog = pastIssueLog.filter({ !$0.isEmpty})
                            break
                        }
                    }
                }
            }
        }
        //hides default back button; for security purposes
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
        .onAppear(){
            //enables device to be rotated without allowing access to other screens by "locking" it into portrait mode
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
}


struct NeedsAttention_Previews: PreviewProvider {
    static var previews: some View {
        NeedsAttention()
    }
}
