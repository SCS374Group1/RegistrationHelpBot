//
//  BotResponse.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import Foundation

//checks to see whether the bot is able to respond to a given user input
func getBotResponse(message: String) -> String {
    //converts user message to lowercase values for easier comparison
    let tempMessage = message.lowercased()
    //default checks for greetings and pleasantries
    if tempMessage.contains("hello") {
        return "Hey there!"
    } else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    }
//default prompt detection and subsequent responses
    //questions regarding the registration process
    if tempMessage.contains("how do i register"){
        return "First, you must meet with your advisor(s) and seek approval of your schedule before you can register. Then, on the day of registration, navigate to GriffinGate. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option; make sure you also have the correct term selected. Search for the course you wish to register for. Select the checkbox next to the course and click the \"Add Course\" button. Repeat this process for each of your desired courses."
    }else if tempMessage.contains("where do i go to register"){
        return "On the day of registration, navigate to GriffinGate, which can be found here: https://griffingate.setonhill.edu/ics. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option. Finally, make sure you also have the correct term selected. This is where you select the courses you wish to register for."
    }else if tempMessage.contains("when do i register"){
        //detects which year classification a student falls under and outputs answer based on this value
        var studentYearClassification = String()
        studentYearClassification = "Senior"
        switch studentYearClassification {
            case "Freshman":
                return "As a Freshman, your schedule date for Spring 2023 is Friday, 11/4/2022 at 6:00 AM."
            case "Sophomore":
                return "As a Sophomore, your schedule date for Spring 2023 is Thursday, 11/3/2022 at 6:00 AM."
            case "Junior":
                return "As a Junior, your schedule date for Spring 2023 is Wednesday, 11/2/2022 at 6:00 AM."
            case "Senior":
                return "As a Senior, your schedule date for Spring 2023 is Tuesday, 11/1/2022 at 6:00 AM."
            case "Graduate":
                return "As a Graduate, your schedule date for Spring 2023 is Monday, 10/31/2022 at 6:00 AM."
            default:
                return "Sorry, I'm having an issue retrieving your status. Please try again later or open a support ticket."
        }
    }else if tempMessage.contains("do i have any holds on my account"){
        var hasHolds = Bool();
        //*****RANDOM VAR CREATED TO AVOID WARNING OF IF_ELSE NEVER EXECUTING HALF OF THE STATEMENT THAT OCCURS WHEN HASHOLD IS HARDCODED INTO THE PROGRAM*****//
        let randomVal = arc4random_uniform(3)
        if(randomVal == 0){
            hasHolds = true
        }else{
            hasHolds = false
        }
        if(hasHolds){
            return "Yes, you do have a hold on your account. Please contact the registrar for more info."
        }else{
            return "No, you do not have any holds on your account."
        }
    }else if tempMessage.contains("when is my registration advising meeting"){
        return "Your registration advising meeting is set for MONTH,DAY,YEAR, at HOURS:MINUTES(AM/PM)."
    }else if tempMessage.contains("how do i cross-register"){
        return "To Cross-register, you must obtain all necessary signatures on the Cross-Registration Form and email this form to helpfinreg@setonhill.edu. Note: It is your responsibility to be aware of the academic calendar for the other institutions.  Dates may not correspond with Seton Hill’s calendar for drop/add, breaks, exams, etc. Cross-registration is not allowed for the summer term or the semester in which you graduate, and some courses will not be approved for cross-registration."
    }else if tempMessage.contains("where are the cross-registration forms"){
        return "The cross-registration forms can be found by going to my.setonhill.edu, logging in, navigating to Documents & Forms, and clicking the link to acces the documents and forms website."
    }else if tempMessage.contains("how do i substitute a course"){
        //***COULD NOT FIND DATA***//
       return "Please contact the registrar for information on how courses are substituted."
    }else if tempMessage.contains("where are the course substitution forms"){
        //***COULD NOT FIND DATA***//
       return "Please contact the registrar for course substitution forms."
    }


 //questions pertaining to adding or dropping courses
if tempMessage.contains("how do i add a class"){
        //returns instructions to add a course as per Seton Hill University
        return "Adding a class before the add/drop period closes is easy!\nLog into MySHU and go to GriffinGate. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option; make sure you also have the correct term selected. Search for the course(s) you wish to add. Finally, select the checkbox next to the course and click the \"Add Course\" button!"
    }else if tempMessage.contains("how do i drop a class"){
        return "Dropping a class before the add/drop period closes is easy!\nLog into MySHU and go to GriffinGate. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option; make sure you also have the correct term selected. Select the checkbox next to the course(s) and then click the \"Drop Course\" button!"
    }else if tempMessage.contains("when does the add/drop period close"){
        //establishes variable to hold add/drop period closing date
        let closingDate = Date(timeIntervalSinceReferenceDate: 696124800)
        //converts closing date to string to output with return statement
        let closingDateString = closingDate.formatted(.dateTime.day().month().year())
        //establishes variable to hold current date
        let todayDate = Date.now;
        //evaluates whether the add/drop period closing date has passed or is in the future and responds accordingly
        if(closingDate < todayDate){
            return "The Add/Drop period for the Spring 2023 semester closed on " + closingDateString + "."

        }else if (closingDate > todayDate){
            return "The Add/Drop period for the Spring 2023 semester closes on " + closingDateString + "."
        }else {
            return "The Add/Drop period for the Spring 2023 semester closes today, " + closingDateString + "."
        }
    }


    //displays registrar's or advisor's contact info
 if tempMessage.contains("registrar email"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("registrar phone"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("advisor phone"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("advisor email"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }
//questions regarding registration day
if tempMessage.contains("what time does registration open") {
        /*-----STUB-----*/
        return "ans"
    } else if tempMessage.contains("what courses are available") {
        /*-----STUB-----*/
        return "ans"
    } else if tempMessage.contains("what course should i take") {
        /*-----STUB-----*/
        return "ans"
    } else if tempMessage.contains("how many seats are left") {
        /*-----STUB-----*/
            return "Input course code"
        }


//questions regarding GPA
    if tempMessage.contains("what gpa do i need as an honors student") {
        /*-----STUB-----*/
        return "ans"
    } else if tempMessage.contains("what gpa do i need as an athlete") {
        /*-----STUB-----*/
        return "ans"
    } else if tempMessage.contains("what is my gpa") {
        /*-----STUB-----*/
        return "ans"
    }else if tempMessage.contains("at what gpa are you on academic probation") {
        /*-----STUB-----*/
        return "ans"
    }


//questions regarding credits
    if tempMessage.contains("how many credits do i need for each grade level") {
        /*-----STUB-----*/
        return "ans"
    } else if tempMessage.contains("how many credits can i take per semester") {
        /*-----STUB-----*/
        return "ans"
    } else if tempMessage.contains("how much do extra credits cost") {
        /*-----STUB-----*/
        return "ans"
    }else if tempMessage.contains("how many credits do i currently have") {
        /*-----STUB-----*/
        return "ans"
    }else if tempMessage.contains("how many credits do i need as an athlete") {
        /*-----STUB-----*/
        return "ans"
    } else if tempMessage.contains("how many credits to be a full/part time student") {
        /*-----STUB-----*/
        return "ans"
    }else {
        return "That's cool."
    }
}

