//
//  AdvisorChatView.swift
//  RegistraionHelpBot
//
//  Created by Ainsley Plumadore on 3/1/23.
//

import SwiftUI


//the Chatbot view of the Chatbot
struct AdvisorChatView: View {
//variable to enable dismiss action, used for custom back arrow
                @Environment(\.dismiss) private var dismiss

    
    //variable to hold botIcon Image
    let botIcon = Image("Outlined RegistrationHelpbot Icon")
    
//variables to hold messages to be sent back and forth
    @State private var showDetails = false
    @State private var messageText = ""
    @State private var feedbackMessage = ""
    @State var messages: [String] = ["Welcome to the Registration HelpBot. Please type your message below that you wish to send."]
    @State private var presentAlert = false
    @AppStorage ("toggleBubbleColor1") var toggleBubbleColor1 = false
    @AppStorage ("toggleBubbleColor2") var toggleBubbleColor2 = false
    @AppStorage ("toggleBubbleColor3") var toggleBubbleColor3 = false
    @AppStorage ("toggleBubbleColor4") var toggleBubbleColor4 = false
    @AppStorage ("toggleBubbleColor5") var toggleBubbleColor5 = false
    @AppStorage ("toggleBubbleColor6") var toggleBubbleColor6 = false
    @AppStorage ("toggleBubbleColor7") var toggleBubbleColor7 = false
    @AppStorage ("toggleBubbleColor8") var toggleBubbleColor8 = false
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
                    Spacer()
                        .frame(minWidth: 120, maxWidth: 120)
                    Button {
                        presentAlert = true
                    } label: {
                        Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                    }
                    .alert("Feed Back", isPresented: $presentAlert, actions: {
                        TextField("TextField", text: $feedbackMessage)
                        Button("Send", action: {sendFeedbackMessage(message: feedbackMessage)})
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
                                    if toggleBubbleColor1 {
                                        Spacer()
                                        Text(newAdMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("sea").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor2 {
                                        Spacer()
                                        Text(newAdMessage)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Image("tree").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor3 {
                                        Spacer()
                                        Text(newAdMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("sand").resizable().opacity(0.8))
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    }else if toggleBubbleColor4 {
                                        Spacer()
                                        Text(newAdMessage)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Image("cyber").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor5 {
                                        Spacer()
                                        Text(newAdMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("yellow").resizable().opacity(0.8))
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor6 {
                                        Spacer()
                                        Text(newAdMessage)
                                            .padding()
                                            .foregroundColor(.white)
                                            .background(Image("red").resizable().opacity(0.75))
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor7 {
                                        Spacer()
                                        Text(newAdMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("green").resizable().opacity(0.8))
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor8 {
                                        Spacer()
                                        Text(newAdMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("cyan").resizable().opacity(0.8))
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else {
                                        Spacer()
                                        Text(newAdMessage)
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
            //adds customized back button to toolbar
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //sends user back to screen they were previously on, in this case the Student List
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Student List")
                        }
                    }
                }
            }
            //hides default back button
        }.navigationBarBackButtonHidden(true)
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
    
    func sendFeedbackMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.feedbackMessage = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation {
                messages.append(sendFeedback(message: message, admin: 1))
            }
        }
    }
}


struct AdvisorChatView_Previews: PreviewProvider {
    static var previews: some View {
        AdvisorChatView()
        
    }
}
