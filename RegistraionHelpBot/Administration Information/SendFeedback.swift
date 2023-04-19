//
//  SendFeedback.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/23/23.
//

import Foundation

func sendFeedback(message: String, admin: Int) -> String {
    //defines mailbox text file
    let file = "feedbackMessages.txt"
        //creates message to be saved
        let newMessage = message.replacingOccurrences(of:"[USER]", with: "")
        let feedbackText = newMessage
        
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

func sendFeedbackAdv(message: String, admin: Int) -> String {
    
    let file = "feedbackMessages.txt"
    
    let newAdMessage = message.replacingOccurrences(of:"[ADV]", with: "")
    let feedbackText = newAdMessage
    
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        
        let fileURL = dir.appendingPathComponent(file)
        
        //attempts writing to file
        do {
            try feedbackText.write(to: fileURL, atomically: false, encoding: .utf8)
        }
        catch {print("ERROR TRYING TO WRITE TO MAILBOX FILE.")}
    }
    
    return "Message \"" + message + "\" Sent to Admin " + String(admin)
}
