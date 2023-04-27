//
//  SendFeedback.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/23/23.
// Refactored by Shane Simpson on 4/27/23.
//

import Foundation


//function for sending feedback from a student to the admin
func sendFeedback(message: String, admin: Int) -> String {
    //defines mailbox text file
    let file = "feedbackMessages.txt"
        //creates message to be saved
        let newMessage = message.replacingOccurrences(of:"[USER]", with: "")
    //appends the new message to the logs
    recentFeedbackLog.append(newMessage)
    var feedbackText = ""
        for i in 0...(recentFeedbackLog.count-1){
            feedbackText.append(recentFeedbackLog[i])
            feedbackText.append("\n")
        }
        //checks for mailbox file and writes to it if the file is found
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //attempts writing to file
            do {
                try feedbackText.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {print("ERROR TRYING TO WRITE TO MAILBOX FILE.")}
        }
    //sends message back to advisor to confirm that message was sent
    return "Message \"" + message + "\" Sent to Admin " + String(admin)
}


//function for sending feedback from an advisor to the admin
func sendFeedbackAdv(message: String, admin: Int) -> String {
    //defines mailbox text file
    let file = "feedbackMessages.txt"
        //creates message to be saved
        let newMessage = message.replacingOccurrences(of:"[ADV]", with: "")
    //appends the new message to the logs
    recentFeedbackLog.append(newMessage)
    var feedbackText = ""
        for i in 0...(recentFeedbackLog.count-1){
            feedbackText.append(recentFeedbackLog[i])
            feedbackText.append("\n")
        }
        //checks for mailbox file and writes to it if the file is found
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //attempts writing to file
            do {
                try feedbackText.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {print("ERROR TRYING TO WRITE TO MAILBOX FILE.")}
        }
    //sends message back to advisor to confirm that message was sent
    return "Message \"" + message + "\" Sent to Admin " + String(admin)
}

