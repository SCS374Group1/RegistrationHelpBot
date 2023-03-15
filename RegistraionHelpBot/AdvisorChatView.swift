//
//  AdvisorChatView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/1/23.
//

import SwiftUI


//the Chatbot view of the Chatbot
struct AdvisorChatView: View {
    //variable to hold botIcon Image
    let botIcon = Image("Outlined RegistrationHelpbot Icon")
    
//variables to hold messages to be sent back and forth
    @State private var showDetails = false
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to the Registration HelpBot. Please type your message below that you wish to send."]
    @State private var presentAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                //top header with botIcon image
                HStack {
                    NavigationLink(destination: SettingsMenuView()) {
                        Image(systemName: "gear")
                    }
                    .buttonStyle(BlueButton())
                    Spacer()
                        .frame(minWidth: 120, maxWidth: 120)
                    botIcon
                        .resizable()
                        .frame(width: 48.0, height: 48.0)
                    Spacer()
                        .frame(minWidth: 120, maxWidth: 120)
                    Button {
                        presentAlert = true
                    } label: {
                        Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                    }
                    .alert("Feed Back", isPresented: $presentAlert, actions: {
                        TextField("TextField", text: $messageText)
                        Button("Send", action: {sendMessage(message: messageText)})
                    })
                }
                //scrollable message view that simulates text messages between the user and the bot
                ScrollView {
                    //checks messages to see if they came from the user or the bot; if from the user, format on the right side with appropriate colors, if from the bot, format on the left side with appropriate colors
                    ForEach(messages, id: \.self) { message in
                        if message.contains("[ADV]") {
                            //replaces [ADV] tag with blank space
                            let newAdMessage = message.replacingOccurrences(of:
                                                                                "[ADV]", with: "")
                            
                            HStack {
                                Spacer()
                                Text(newAdMessage)
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
    }

//function to send messages to the bot from the user
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[ADV]" + message)
            self.messageText = ""
        }
        
//sends message to bot and to desired student
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation {
                messages.append(sendAdvMessage(message: message, student: 1))
            }
        }
    }
}


struct AdvisorChatView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisorChatView()
        
    }
}



