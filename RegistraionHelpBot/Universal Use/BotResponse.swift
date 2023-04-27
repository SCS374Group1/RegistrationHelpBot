//
//  BotResponse.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import Foundation

//variable that holds the studentArrayID Number; defaults to 100 as this is out of bounds of the array (intentionally done to enforce good security practices)
public var studentArrayIDNumber = 100

//message buffer variable created to hold a message in the event that a request cannot be processed to allow the user to specify whether they want their message sent to their advisor + the admin or not
var messageBuffer = "null"
//establishes random forwarding code to be used in a given session
let forwardingCode = Int.random(in: 1000..<10000)

//function to check mailbox file and notify users if any messages have been posted
func getMessages() -> String{
    //attempts to create and read from the file
    do {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            //establishes file URL
            let fileURL = dir.appendingPathComponent("advisorMessages.txt")

            //reads file; if it is blank, send a specific message; otherwise, send message indicating that their is mail for the user
            do {
                let inputText = try String(contentsOf: fileURL, encoding: .utf8)
                if(inputText==""){
                    return "You have no new messages."
                    //checks to see if the message is for the given student and displays the appropriate message
                }else if(inputText.contains("STU"+String(loadedStudentData[studentArrayIDNumber].studentID))){
                    return "You have a new message from ADVISORNAME. Type \"Mailbox\" to view."
                }
            }
            //prints error message
            catch {print("ERROR RETRIEVING MAILBOX DATA")}

        }
        //if no messages are found, responds as such
        return "No messages found."
    }
}

//function to check for messages forwarded to advisors from a student and prints the message to the advisor's chat view
func getForwardMessages() -> String{
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        //establishes fileURL
        let fileURL = dir.appendingPathComponent("forwardMessage.txt")
        
        //reads from the forward mailbox and clears it after reading
        do {
            //writes file to inputText
            let inputText = try String(contentsOf: fileURL, encoding: .utf8)
            let cleanupText = ""
            if(inputText.contains("ADVFW")){
                //removes prefixes from the inputText and logs which student ID was found in the prefix
                let nonADVFWPrefixInputText = inputText.replacingOccurrences(of: "ADVFW", with: "")
                let studentIDPrefix = nonADVFWPrefixInputText.prefix(3)
                let plainMessage = nonADVFWPrefixInputText.replacingOccurrences(of: studentIDPrefix, with: "")
                //purges file contents
                try cleanupText.write(to: fileURL, atomically: false, encoding: .utf8)
                //returns a response based on whether any input was received from the file, alongside the student's ID
                if(inputText==""){
                    return "No new messages."
                }else{
                    return "\"" + plainMessage + "\"" + " from Student " + studentIDPrefix + "."
                }
            }
        }
        //error message
        catch {print("ERROR RETRIEVING MESSAGE")}
    }
    //returns this if no messages are found
    return "No messages found."
}


//function to get all the data related to admin feedback messages
func getFeedbackMessages() -> String{
    //attempts to create and read from the file
    do {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            //establishes file URLs for the new feedback messages, messages that still need attention, and the log of past issues
            let feedbackFileURL = dir.appendingPathComponent("feedbackMessages.txt")
            let attentionFileURL = dir.appendingPathComponent("needsAttention.txt")
            let pastIssueFileURL = dir.appendingPathComponent("pastIssueLogs.txt")
            //reads file; if it is blank, send a specific message; otherwise, send message indicating that their is mail for the user
            do {
                //updates new issue array with contents from the file, if any
                let feedbackInputText = try String(contentsOf: feedbackFileURL, encoding: .utf8)
                //separator is a line break
                recentFeedbackLog = feedbackInputText.components(separatedBy: "\n")
                //updates needs attention array with contents from the file, if any
                let attentionInputText = try String(contentsOf: attentionFileURL, encoding: .utf8)
                //separator is a line break
                needsAttentionLog = attentionInputText.components(separatedBy: "\n")
                //updates past issue array with contents from the file, if any
                let pastIssueInputText = try String(contentsOf: pastIssueFileURL, encoding: .utf8)
                //separator is a line break
                pastIssueLog = pastIssueInputText.components(separatedBy: "\n")
                
                //if the feedback input text is blank, then no messages were found
                if(feedbackInputText==""){
                    return "You have no new messages."
                }else{
                    //uses keyword prompt so user has to manually input their desire to read the message
                    return "You have a new message. Type \"Read\" to view."
                    
                }
            }
            //error message
            catch {print("ERROR RETRIEVING FEEDBACK MAILBOX DATA")}

        }
        return "No messages found."
    }
}

//file to retrieve parameter enables this function to be used in multiple instances
func getRecentFeedback(inputText3: String, fileToRetrieve: String) -> String {
    do {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(fileToRetrieve)
            do {
                let inputText2 = try NSString(contentsOf: fileURL, encoding: String.Encoding.utf8.rawValue)
                var inputText3 = inputText2 as String
                return inputText3
            }
            catch{print("ERROR RETRIVING FEEDBACK DATA")}
        }
    }
    return inputText3
}

//checks to see whether the bot is able to respond to a given user input
func getBotResponse(message: String) -> String {
    //converts user message to lowercase values for easier comparison
    let tempMessage = message.lowercased()
    //default checks for greetings and pleasantries
    if (tempMessage.contains("hello") || tempMessage.contains("hey") || tempMessage.contains("howdy")) {
        return "Hey there!"
    } else if (tempMessage.contains("goodbye") || tempMessage.contains("bye") || tempMessage.contains("cya")) {
        return "Talk to you later!"
    } else if (tempMessage.contains("how are you")) {
        return "I'm fine, how about you?"
    }
    
    //detects whether the user enters a message that indicates they need counseling services or other support services
    if (tempMessage.contains("want to die") || tempMessage.contains("kill myself") || tempMessage.contains("hurt myself") || tempMessage.contains("harm myself") || tempMessage.contains("commit self-harm") || tempMessage.contains("suicide")){
        return "Hey. While I may just be a robot, I care about your mental health and wellbeing. Mental health is a serious topic. If you are experiencing harmful thoughts, please contact counseling services by emailing counselingcenter@setonhill.edu or by calling Campus Police to get a counseling appointment scheduled."
    }
    
    //checks to see if a student user wishes to access their mailbox
    if tempMessage.contains("mailbox"){
        //declares filepath to check for mailbox
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("advisorMessages.txt")

            //reads from the mailbox and clears it after reading
            do {
                let inputText = try String(contentsOf: fileURL, encoding: .utf8)
                let cleanupText = ""
                //checks to make sure the message is for the currently logged-in student
                if(inputText.contains("STU"+String(loadedStudentData[studentArrayIDNumber].studentID))){
                    //if it is, clean up the file and display the message
                    try cleanupText.write(to: fileURL, atomically: false, encoding: .utf8)
                    return "Most recent message from ADVISORNAME: \"" + inputText.replacingOccurrences(of: ("STU"+String(loadedStudentData[studentArrayIDNumber].studentID)), with: "") + "\""
                    //otherwise, do not display the message and do not clean up the file
                }else if(inputText==""){
                    return "No new messages."
                }else{
                    return "An error occurred reading the mailbox. Please contact the administrator."
                }
            }
            catch {print("ERROR RETRIEVING MESSAGE")}

        }
        return "No messages found."
    }
    
    //if the admin states that they wish to read recent feedback
    if tempMessage.contains("read"){
        //pull the recent feedback from the array log and display it
        var returnMessage = "Latest messages:"
        for i in 0...(recentFeedbackLog.count-1) {
            returnMessage.append(recentFeedbackLog[i])
            returnMessage.append("\n")
        }
        //prompts admin to save the messages
        returnMessage.append("Please type \"Save\" to send messages to the Needs Attention file.")
        return returnMessage
    }
    //if the admin states that they wish to save the recent feedback
    if tempMessage.contains("save") {
        //copies the recent feedback to the needs attention array
        for i in 0...(recentFeedbackLog.count-1){
            needsAttentionLog.append(recentFeedbackLog[i])
        }
        //writes the data from the needs attention array to the needs attention file
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            do{
                var attentionInputText = ""
                for i in 0...(needsAttentionLog.count-1){
                    attentionInputText.append(needsAttentionLog[i])
                    attentionInputText.append("\n")
                }
                //filters out empty instances in the array before writing
                needsAttentionLog = needsAttentionLog.filter({ !$0.isEmpty})
                
                //writes to file
                let attentionFileURL = dir.appendingPathComponent("needsAttention.txt")
                try attentionInputText.write(to: attentionFileURL, atomically: false, encoding: .utf8)
                
                //clears new messages from the recent feedback file
                do{
                    let feedbackFileURL = dir.appendingPathComponent("feedbackMessages.txt")
                    let cleanupText = ""
                    try cleanupText.write(to: feedbackFileURL, atomically: false, encoding: .utf8)
                }
                //error code for clearing the data
                catch{
                    print("ERROR CLEANING FILE")
                    return "An error occurred moving the data (Error Code: 10C)"
                }
                
                return "Feedback messages saved."
            }
            //error code for writing to the file
            catch{
                print("ERROR WRITING TO ATTENTION FILE")
                return "An error occurred moving the data (Error Code: 10A)"
            }
        }
    }
    
//default prompt detection and subsequent responses
    //questions regarding the registration process
    if tempMessage.contains("how") && tempMessage.contains("do i") && tempMessage.contains("register"){
        // how do i register (sample question)
        return "First, you must meet with your advisor(s) and seek approval of your schedule before you can register. Then, on the day of registration, navigate to GriffinGate. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option; make sure you also have the correct term selected. Search for the course you wish to register for. Select the checkbox next to the course and click the \"Add Course\" button. Repeat this process for each of your desired courses."
    }else if tempMessage.contains("where") && tempMessage.contains("go") && tempMessage.contains("to register"){
        // where do i go to register (sample question)
        return "On the day of registration, navigate to GriffinGate, which can be found here: https://griffingate.setonhill.edu/ics. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option. Finally, make sure you also have the correct term selected. This is where you select the courses you wish to register for."
    }else if tempMessage.contains("when") && tempMessage.contains("i") && tempMessage.contains("register"){
        // when do i register (sample question)
        //detects which year classification a student falls under and outputs answer based on this value
        //checks array created from studentInformation objects with ModelData and Student object for value based on the student who is logged in
        let studentYearClassification = loadedStudentData[studentArrayIDNumber].grade.lowercased()
        //NOTE: This information is up to date as of the Spring 2023 semester
        switch studentYearClassification {
            case "freshman":
                return "As a Freshman, your schedule date for Fall 2023 is Friday, 04/21/2023 at 6:00 AM."
            case "sophomore":
                return "As a Sophomore, your schedule date for Fall 2023 is Thursday, 04/20/2023 at 6:00 AM."
            case "junior":
                return "As a Junior, your schedule date for Fall 2023 is Wednesday, 04/19/2023 at 6:00 AM."
            case "senior":
                return "As a Senior, your schedule date for Fall 2023 is Tuesday, 04/18/2023 at 6:00 AM."
            case "graduate":
                return "As a Graduate, your schedule date for Fall 2023 is Monday, 04/17/2023 at 6:00 AM."
            default:
                return "Sorry, I'm having an issue retrieving your status. Please try again later or open a support ticket."
        }
    }else if tempMessage.contains("have") && tempMessage.contains("holds"){
        //do i have any holds on my account (sample question)
        //checks if student who is logged in has holds on their account
        if(loadedStudentData[studentArrayIDNumber].hasAccountHolds){
            return "Yes, you do have a hold on your account. Please contact the registrar for more info."
        }else{
            return "No, you do not have any holds on your account."
        }
    }else if tempMessage.contains("when") && tempMessage.contains("advising") && tempMessage.contains("meeting"){
        //when is my registration advising meeting (sample question)
        return "Your registration advising meeting is set for MONTH,DAY,YEAR, at HOURS:MINUTES(AM/PM)."
    }else if tempMessage.contains("cross-register") || tempMessage.contains("cross register"){
        // how do i cross-register (sample question)
        return "To Cross-register, you must obtain all necessary signatures on the Cross-Registration Form and email this form to helpfinreg@setonhill.edu. Note: It is your responsibility to be aware of the academic calendar for the other institutions.  Dates may not correspond with Seton Hill’s calendar for drop/add, breaks, exams, etc. Cross-registration is not allowed for the summer term or the semester in which you graduate, and some courses will not be approved for cross-registration."
    }else if tempMessage.contains("cross-registration") || tempMessage.contains("cross registration") && tempMessage.contains("forms"){
        // where are the cross-registration forms (sample question)
        return "The cross-registration forms can be found by going to my.setonhill.edu, logging in, navigating to Documents & Forms, and clicking the link to acces the documents and forms website."
    }else if tempMessage.contains("do") && tempMessage.contains("substitute") && tempMessage.contains("course"){
        // how do i substitute a course (sample question)
        //***COULD NOT FIND DATA***//
       return "Please contact the registrar for information on how courses are substituted."
    }else if tempMessage.contains("where") && tempMessage.contains("course") && tempMessage.contains("substitution") && tempMessage.contains("forms"){
        // where are the course substitution forms (sample question)
        //***COULD NOT FIND DATA***//
       return "Please contact the registrar for course substitution forms."
    }


 //questions pertaining to adding or dropping courses
    if tempMessage.contains("how") && tempMessage.contains("add") && tempMessage.contains("class"){
    // how do i add a class (sample question)
        //returns instructions to add a course as per Seton Hill University
        return "Adding a class before the add/drop period closes is easy!\nLog into MySHU and go to GriffinGate. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option; make sure you also have the correct term selected. Search for the course(s) you wish to add. Finally, select the checkbox next to the course and click the \"Add Course\" button!"
    }else if tempMessage.contains("how") && tempMessage.contains("drop") && tempMessage.contains("class"){
        // how do i drop a class (sample question)
        return "Dropping a class before the add/drop period closes is easy!\nLog into MySHU and go to GriffinGate. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option; make sure you also have the correct term selected. Select the checkbox next to the course(s) and then click the \"Drop Course\" button!"
    }else if tempMessage.contains("when") && tempMessage.contains("add/drop") && tempMessage.contains("period"){
        // when does the add/drop period close (sample question)
        //establishes variable to hold add/drop period closing date
        let closingDate = Date(timeIntervalSinceReferenceDate: 714614400)
        //converts closing date to string to output with return statement
        let closingDateString = closingDate.formatted(.dateTime.day().month().year())
        //establishes variable to hold current date
        let todayDate = Date.now;
        //evaluates whether the add/drop period closing date has passed or is in the future and responds accordingly
            //date is in the past
        if(closingDate < todayDate){
            return "The Add/Drop period for the Spring 2023 semester closed on " + closingDateString + "."
            //date is in the future
        }else if (closingDate > todayDate){
            return "The Add/Drop period for the Spring 2023 semester closes on " + closingDateString + "."
        }else {
            //date is the current date
            return "The Add/Drop period for the Spring 2023 semester closes today, " + closingDateString + "."
        }
    }


    //displays registrar's or advisor's contact info
    if tempMessage.contains("registrar email") || tempMessage.contains("registrar's email") || tempMessage.contains("registrars email"){
     //registrar email (sample statement)
        return "HelpFinReg@setonhill.edu"
    }else if tempMessage.contains("registrar phone") || tempMessage.contains("registrar's phone") || tempMessage.contains("registrars phone"){
        //registrar phone (sample statement)
        return "(724) 830-1010"
    }else if tempMessage.contains("advisor phone") || tempMessage.contains("advisor's phone") || tempMessage.contains("advisors phone"){
        //advisor phone (sample statement)
        return "Please contact registrar to find out the advisor's phone number if it is unknown to you."
    }else if tempMessage.contains("advisor email") || tempMessage.contains("advisor's email") || tempMessage.contains("advisors email"){
        //advisor email (sample statement)
        return "Please contact registrar to find out the advisor's email if it is unknown to you."
    }
    //questions regarding registration day using key words found in a question to trigger the bots response
        if (tempMessage.contains("time") && tempMessage.contains("registration") && tempMessage.contains("open")) {
            //what time does registration open (sample question)
            return "Registration opens at 6am on your given registration day."
        } else if (tempMessage.contains("courses") && tempMessage.contains("available")) {
            //what courses are available (sample question)
            return "Please refer to the course catalog under the registration tab on MySHU."
        } else if (tempMessage.contains("course") && tempMessage.contains("take")) {
            //what course should i take (sample question)
            return "Schedule a meeting with your advisor to discusse what courses are best for you to take at this time."
        } else if (tempMessage.contains("seats") && tempMessage.contains("left")) {
            //how many seats are left (sample question)
            return "To find this go to MySHU, then GriffinGate. Click on the Student tab and locate Course Registration and Advising. Next locate Add/Drop Courses and click then and then enter the course code for the course you wish to know about."
        }


    //questions regarding GPA using key words found in a question to trigger the bots response
        //response for GPA as an honors student based on SHU guidelines
        if (tempMessage.contains("gpa") && tempMessage.contains("honors") && tempMessage.contains("student")) {
            //what gpa do i need as an honors student (sample question)
            return "You need to maintain a GPA of 3.5 or higher to be in the Seton Hill Honors Program."
        } else if (tempMessage.contains("gpa") && tempMessage.contains("academic") && tempMessage.contains("probation")) {
            //at what gpa are you on academic probation (sample question)
            return "Please refer to the registrar."
        } else if (tempMessage.contains("gpa") && tempMessage.contains("athlete")) {
            //what gpa do i need as an athlete (sample question)
            return "Please refer to the registrar."
        }else if (tempMessage.contains("gpa") && tempMessage.contains("my")) {
            //what is my gpa (sample question)
            //checks current student GPA based on the student who is logged in
            return "Your GPA is " + String(loadedStudentData[studentArrayIDNumber].gpa)  + "."
        }

    //questions regarding credits using key words found in a question to trigger the bots response
        if ((tempMessage.contains("credits") && tempMessage.contains("need") && tempMessage.contains("grade") && tempMessage.contains("level")) || (tempMessage.contains("credits") && tempMessage.contains("freshman")) || (tempMessage.contains("credits") && tempMessage.contains("sophmore")) || (tempMessage.contains("credits") && tempMessage.contains("junior")) || (tempMessage.contains("credits") && tempMessage.contains("senior"))) {
            //how many credits do i need for each grade level (sample question)
            return "A minimum of 120 credits are needed to graduate at Seton Hill, meaning that per each grade level, approximately 30 credits are needed. This comes out to about 15 credits a semester."
        } else if ((tempMessage.contains("credits") && tempMessage.contains("full") && tempMessage.contains("time") && tempMessage.contains("student")) || (tempMessage.contains("credits") && tempMessage.contains("part") && tempMessage.contains("time") && tempMessage.contains("student")) || (tempMessage.contains("credits") && tempMessage.contains("full") && tempMessage.contains("part") && tempMessage.contains("time") && tempMessage.contains("student"))) {
            //how many credits to be a full/part time student (sample question)
            return "Registration for a minimum of 12 credits in a semester is required for full-time status at the undergraduate level, any number of credits below 12 is considered a part-time status."
        } else if (tempMessage.contains("credits") && tempMessage.contains("take") && tempMessage.contains("per") && tempMessage.contains("semester")) {
            //how many credits can i take per semester (sample question)
            return "Students may take up to 17 credits per semester without extra charge, however, if they would like to, the student is able to overload up to 21 credits per semester. This requires registrar permission to do so."
        }else if (tempMessage.contains("extra") && tempMessage.contains("credits") && tempMessage.contains("cost")) {
            //how much do extra credits cost (sample question)
            return "As of August of 2022, extra credits come at a cost of $798 per extra credit up to 21 credits per semester. This cost includes any credits after 17."
        }else if (tempMessage.contains("credits") && tempMessage.contains("currently") && tempMessage.contains("have")) {
            //how many credits do i currently have (sample question)
            //checks how many credits the student currently logged in has
            return "Currently, you have " + String(loadedStudentData[studentArrayIDNumber].credits) + " credits."
        } else if (tempMessage.contains("credits") && tempMessage.contains("athlete")) {
            //how many credits do i need as an athlete (sample question)
            return "As per the NCAA Athletic Scholarship Satisfactory Academic Progress Policy. Any student who receives an athletic scholarship while attending Seton Hill University is bound by the NCAA Division II academic progress regulations. This policy states that a full-time student must earn a minimum of 24 credits in each academic year, which equates to 12 credits a semester. This is on par with the full-time student requirements for Seton Hill."
        }
    
// Course offerings
    if tempMessage.contains("next") && tempMessage.contains("semester") && tempMessage.contains("courses"){
        // what are next semester's courses (sample question)
        return "https://setonhill.policytech.com/dotNet/documents/?docid=3713&public=true"
    }
    
    // Course recommendations using key words found in a question to trigger the bots response
        if (tempMessage.contains("courses") && tempMessage.contains("recommend") && tempMessage.contains("take")) {
            //what courses do you recommend i take (sample question)
            // creates an array of the three available courses for students depending on their student ID
            let randomCourseSet = [loadedStudentData[studentArrayIDNumber].course1, loadedStudentData[studentArrayIDNumber].course2, loadedStudentData[studentArrayIDNumber].course3]
            // creates a new variable that holds the value of the randomly generated element from
            // the array that was created above
            let randomCoursePicker = randomCourseSet.randomElement()!
          // returns a statement that uses the randomly picked course and recommends which course to take to the student
            return "I recommend that you take " + String(randomCoursePicker) + " if you have any scheduling issues."
        }
    
    //handles messages that do not have a response
        //first checks to see if the message contains the forwarding code, and if so, forwards the message
    if tempMessage.contains("forward-" + String(forwardingCode)){
        //uses forwardToAdvisor function found in AdvisorMessagingFunc
        //appends prefix such that the advisor can determine which student the message came from
        print(forwardToAdvisor(message: "ADVFW" + String(loadedStudentData[studentArrayIDNumber].studentID) + messageBuffer, advisor: loadedStudentData[studentArrayIDNumber].advisorID, student: loadedStudentData[studentArrayIDNumber].studentID))
        return "Your message has been forwarded. Thank you!"
    //otherwise, it stores the most recently sent message into the buffer and offers to forward this message to the advisor
        //user must type in the forwarding code (with the randomly generated forwarding number) in order to forward the message to prevent spam
    }else {
        //message buffer to store the most recently sent message in the event that the student would like to forward it to their advisor
        messageBuffer = message
        return "I'm sorry, I could not process your request. If you would like this request to be forwarded to your advisor, please type \"Forward-" + String(forwardingCode) + "\"."
}
}

