//
//  AdvisorMessagingFunc.swift
//  RegistraionHelpBot
//
//  Created by Shane Simpson on 3/1/23.
//

import Foundation
//function to send the advisor message to the student
func sendAdvMessage(message: String , student: Int) -> String {
    //defines mailbox text file
    let file = "advisorMessages.txt"
    //creates message to be saved
    let newAdMessage = message.replacingOccurrences(of:"[ADV]", with: "")
    let advText = newAdMessage
    
    //checks for mailbox file and writes to it if the file is found
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

        let fileURL = dir.appendingPathComponent(file)

        //attempts writing to file
        do {
            try advText.write(to: fileURL, atomically: false, encoding: .utf8)
        }
        catch {print("ERROR TRYING TO WRITE TO MAILBOX FILE.")}
    }
    //sends message back to advisor to confirm that message was sent
    return "Message \"" + message + "\" Sent to Student " + String(student)
}
