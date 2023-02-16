//
//  ChatbotView.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import SwiftUI


//the Chatbot view of the Chatbot
struct ChatbotView: View {
//variables to hold messages to be sent back and forth
    @State private var showDetails = false
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to the Registration HelpBot. Can I help you?"]
    
    @State var category = 1
    @State var questions = 1
    
    
    
    var body: some View {
        VStack {
    //top header with name and image
            HStack {
                Text("Registration HelpBot")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.yellow)
            }
            //scrollable message view that simulates text messages between the user and the bot
            ScrollView {
    //checks messages to see if they came from the user or the bot; if from the user, format on the right side with appropriate colors, if from the bot, format on the left side with appropriate colors
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
//replaces [USER] tag with blank space
                        let newMessage = message.replacingOccurrences(of:
                            "[USER]", with: "")
                        
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            
                        }
//messages from bot
                    } else {
                        HStack {
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
 //Rotation effect to give the illusion of the messages coming up from the bottom
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
//menu selection for preset prompts
            Picker("Question Category Picker", selection: $category) {
                        Text("Please Select a Category").tag(1)
                //registration info prompts
                        Picker("Registration Info", selection: $questions) {
                            Button("How do I register?"){
                                sendMessage(message:"How do I register?")
                            }
                            Button("Where do I go to register?"){
                                sendMessage(message:"Where do I go to register?")
                            }
                            Button("When do I register?"){
                                sendMessage(message:"When do I register?")
                            }
                            Button("Do I have any holds on my account?"){
                                sendMessage(message:"Do I have any holds on my account?")
                            }
                            Button("When is my registration advising meeting?"){
                                sendMessage(message:"When is my registration advising meeting?")
                            }
                            Button("How do I cross-register?"){
                                sendMessage(message:"How do I cross-register?")
                            }
                            Button("Where are the cross-registration forms?"){
                                sendMessage(message:"Where are the cross-registration forms?")
                            }
                            Button("How do I substitute a course?"){
                                sendMessage(message:"How do I substitute a course?")
                            }
                            Button("Where are the course substitution forms?"){
                                sendMessage(message:"Where are the course substitution forms?")
                            }

                        }.pickerStyle(MenuPickerStyle())
                
               //registration day prompts
                Picker("Registration Day", selection: $questions) {
                    Button("What time does registration open?"){
                        sendMessage(message:"What time does registration open?")
                    }
                    Button("What courses are available?"){
                        sendMessage(message:"What courses are available?")
                    }
                    Button("What course should i take?"){
                        sendMessage(message:"What courses are available?")
                    }
                    Button("How many seats are left?"){
                        sendMessage(message:"How many seats are left?")
                    }
                }.pickerStyle(MenuPickerStyle())
                
                //add/drop classes prompts
                Picker("Add/Drop Courses", selection: $questions) {
                    Button("How do I drop a class?"){
                        sendMessage(message:"How do I drop a class?")
                    }
                    Button("How do I add a class?"){
                        sendMessage(message:"How do I add a class?")
                    }
                    Button("When does the add/drop period close?"){
                        sendMessage(message:"When does the add/drop period close?")
                    }
                }.pickerStyle(MenuPickerStyle())
                
                //credits
                Picker("Credits", selection: $questions) {
                    Button("How many credits do I need for each grade level?") {
                        sendMessage(message:"How many credits do I need for each grade level?")
                    }
                    Button("How many credits can I take per semester?") {
                        sendMessage(message:"How many credits can I take per semester?")
                    }
                    Button("How much do extra credits cost?") {
                        sendMessage(message:"How much do extra credits cost?")
                    }
                    Button("How many credits do I currently have?") {
                        sendMessage(message:"How many credits do I currently have?")
                    }
                    Button("How many credits do I need to maintain my athlete status?") {
                        sendMessage(message:"How many credits do I need to maintain my athlete status?")
                    }
                    Button("How many credits to be a full time / part time student?") {
                        sendMessage(message:"How many credits to be a full time / part time student?")
                    }
                }.pickerStyle(MenuPickerStyle())
                Picker("GPA", selection: $questions) {
                    Button("Lorem ipsum"){
                        sendMessage(message:"Lorem Ipsum")
                    }
                }.pickerStyle(MenuPickerStyle())
                Picker("Contact Info", selection: $questions) {
                    Button("Lorem ipsum"){
                        sendMessage(message:"Lorem Ipsum")
                    }
                }.pickerStyle(MenuPickerStyle())
                
                    }.pickerStyle(MenuPickerStyle())
            
            
            
 //text field for the user to type their message in to; allows uers to send the message by hitting enter or clicking the send icon
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
//send icon to send messages
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .foregroundColor(.red)
                .padding(.horizontal, 10)
            }
            .padding()
        }
    }
//function to send messages to the bot from the user
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
//creates a delay between bot and user messages to simulate a real-world conversation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
    }
}




struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView()
        
    }
}


