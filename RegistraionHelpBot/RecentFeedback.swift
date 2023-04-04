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
    //variables to manage togglebuttons on the SettingsMenuView, with each variable corresponding to a different toggle button; info pulled from SettingsMenuView
    @AppStorage ("toggleBubbleColor1") var toggleBubbleColor1 = false
    @AppStorage ("toggleBubbleColor2") var toggleBubbleColor2 = false
    @AppStorage ("toggleBubbleColor3") var toggleBubbleColor3 = false
    @AppStorage ("toggleBubbleColor4") var toggleBubbleColor4 = false
    @AppStorage ("toggleBubbleColor5") var toggleBubbleColor5 = false
    @AppStorage ("toggleBubbleColor6") var toggleBubbleColor6 = false
    @AppStorage ("toggleBubbleColor7") var toggleBubbleColor7 = false
    @AppStorage ("toggleBubbleColor8") var toggleBubbleColor8 = false
    //establishes default background color for the user message bubbles as blue
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
                                //checks to see which toggle button(s) are toggled in the SettingsMenuView and sets the background color as appropriate
                                if toggleBubbleColor1 {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(Image("sea").resizable())
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                } else if toggleBubbleColor2 {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Image("tree").resizable())
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                } else if toggleBubbleColor3 {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(Image("sand").resizable().opacity(0.8))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                }else if toggleBubbleColor4 {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Image("cyber").resizable())
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                } else if toggleBubbleColor5 {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(Image("yellow").resizable().opacity(0.8))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                } else if toggleBubbleColor6 {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Image("red").resizable().opacity(0.75))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                } else if toggleBubbleColor7 {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(Image("green").resizable().opacity(0.8))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                } else if toggleBubbleColor8 {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(Image("cyan").resizable().opacity(0.8))
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                } else {
                                    Spacer()
                                    Text(newAdminMessage)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(backgroundColor).opacity(0.8)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 10)
                                }
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
        //locks screen into portrait orientation
            .onAppear{
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
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
