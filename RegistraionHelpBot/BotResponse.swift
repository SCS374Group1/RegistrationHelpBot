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
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("where do i go to register"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("when do i register"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("do i have any holds on my account"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("when is my registration advising meeting"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("how do i cross-register"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("where are the cross-registration forms"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("how do i substitute a course"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }else if tempMessage.contains("where are the course substitution forms"){
        /*-----STUB-----*/
        return "Lorem Ipsum Dolor Sit Amet " + tempMessage
    }


 //questions pertaining to adding or dropping courses
if tempMessage.contains("how do i add a class"){
        //returns instructions to add a course as per Seton Hill University
        return "Adding a class before the add/drop period closes is easy!\nLog into MySHU and go to GriffinGate. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option; make sure you also have the correct term selected. Search for the course(s) you wish to add. Finally, select the checkbox next to the course and click the \"Add Course\" button!"
    }else if tempMessage.contains("how do i drop a class"){
        return "Dropping a class before the add/drop period closes is easy!\nLog into MySHU and go to GriffinGate. Click \"Student\" and then \"Course Registration and Advising\". There will be an \"Add/Drop\" menu on the right side of the screen. Select the \"Add/Drop Courses\" option; make sure you also have the correct term selected. Select the checkbox next to the course(s) and then click the \"Drop Course\" button!"
    }else if tempMessage.contains("when does the add/drop period close"){
        return "The Add/Drop period for the Spring 2023 semester closed on January 23rd, 2023."
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

