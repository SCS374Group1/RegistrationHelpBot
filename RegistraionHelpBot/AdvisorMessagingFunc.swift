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
    //removes the [ADV] prefix from the message and adds in a STU+studentID prefix
    let newAdMessage = message.replacingOccurrences(of:"[ADV]", with: ("STU"+String(selectedStudent)))
    //creates the message to be saved
    let advText = newAdMessage
    
    //checks for mailbox file and writes to it if the file is found
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        //establishes file URL
        let fileURL = dir.appendingPathComponent(file)

        //attempts writing to file
        do {
            try advText.write(to: fileURL, atomically: false, encoding: .utf8)
        }
        //if a failure occurs, the error message is printed
        catch {print("ERROR TRYING TO WRITE TO MAILBOX FILE.")}
    }
    //sends message back to advisor to confirm that message was sent
    return "Message \"" + message + "\" Sent to Student " + String(student)
}

//function to send messages from the student to the advisor
func forwardToAdvisor(message: String , advisor: Int, student: Int) -> String {
    //defines mailbox text file
    let file = "forwardMessage.txt"
    //removes the [USER] prefix from the message and replaces it with an ADVFW+studentID prefix
    let newFWMessage = message.replacingOccurrences(of:"[USER]", with: ("ADVFW"+String(student)))
    //creates the message to be saved
    let FWText = newFWMessage
    
    //checks for mailbox file and writes to it if the file is found
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        //establishes file URL
        let fileURL = dir.appendingPathComponent(file)

        //attempts writing to file
        do {
            try FWText.write(to: fileURL, atomically: false, encoding: .utf8)
        }
        //if a failure occurs, the error message is printed
        catch {print("ERROR TRYING TO WRITE TO MAILBOX FILE.")}
    }
    //sends message back to advisor to confirm that message was sent
    return "Message \"" + message + "\" Sent to Advisor " + String(advisor)
}
