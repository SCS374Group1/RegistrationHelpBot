//
//  RecentFeedback.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/22/23.
//

import SwiftUI

struct RecentFeedback: View {
    //variable to hold botIcon Image
    let botIcon = Image("Outlined RegistrationHelpbot Icon")
    
//variables to hold messages to be sent back and forth
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to the Registration HelpBot. Can I help you?"]
    let backgroundColor = Image("blue")
    
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
                    //updates student mailbox every time the chatbot view is loaded
                    .onAppear(){
                        messages.append(getFeedbackMessages())
                    }
                }
                .frame(height: 45)
                //scrollable message view that simulates text messages between the user and the bot
                ScrollView {
                    //checks messages to see if they came from the user or the bot; if from the user, format on the right side with appropriate colors, if from the bot, format on the left side with appropriate colors
                    ForEach(messages, id: \.self) { message in
                        if message.contains("[ADMIN]") {
                            //replaces [USER] tag with blank space
                            let newAdminMessage = message.replacingOccurrences(of:
                                                                            "[ADMIN]", with: "")
                            
                            HStack {
                                Spacer()
                                Text(newAdminMessage)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(backgroundColor)
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
            
            //hides default back button
        }.navigationBarBackButtonHidden(true)
    }
//function to send messages to the bot from the user
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[ADMIN]" + message)
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

struct RecentFeedback_Previews: PreviewProvider {
    static var previews: some View{
        RecentFeedback()
    }
}
