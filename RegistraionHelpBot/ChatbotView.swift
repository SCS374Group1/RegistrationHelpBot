//
//  ChatbotView.swift
//  RegistrationHelpBot
//
//  Created by Shane Simpson on 2/14/23.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

//the Chatbot view of the Chatbot
struct ChatbotView: View {
    //variable to hold botIcon Image
    let botIcon = Image("Outlined RegistrationHelpbot Icon")
    
//variables to hold messages to be sent back and forth
    @State private var showDetails = false
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to the Registration HelpBot. Can I help you?"]
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
                        TextField("TextField", text: $messageText)
                        Button("Send", action: {sendMessage(message: messageText)})
                    })
                    //updates student mailbox every time the chatbot view is loaded
                    .onAppear(){
                        messages.append(getMessages())
                    }
                }
                .frame(height: 45)
                //scrollable message view that simulates text messages between the user and the bot
                ScrollView {
                    //checks messages to see if they came from the user or the bot; if from the user, format on the right side with appropriate colors, if from the bot, format on the left side with appropriate colors
                    ForEach(messages, id: \.self) { message in
                        if message.contains("[USER]") {
                            //replaces [USER] tag with blank space
                            let newMessage = message.replacingOccurrences(of:
                                                                            "[USER]", with: "")
                            
                            HStack {
                                    if toggleBubbleColor1 {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("camo").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor2 {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("tree").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor3 {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("naruto").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    }else if toggleBubbleColor4 {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("cyber").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor5 {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("yellow").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor6 {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("red").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor7 {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("green").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else if toggleBubbleColor8 {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(Image("cyan").resizable())
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                    } else {
                                        Spacer()
                                        Text(newMessage)
                                            .padding()
                                            .foregroundColor(.black)
                                            .background(backgroundColor)
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
                //menu selection for preset prompts
                Menu("Please Select a Category") {
                    //registration info prompts
                    Menu("Registration Info") {
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
                        
                    }
                    
                    //registration day prompts
                    Menu("Registration Day") {
                        Button("What time does registration open?"){
                            sendMessage(message:"What time does registration open?")
                        }
                        Button("What courses are available?"){
                            sendMessage(message:"What courses are available?")
                        }
                        Button("What course should I take?"){
                            sendMessage(message:"What courses are available?")
                        }
                        Button("How many seats are left?"){
                            sendMessage(message:"How many seats are left?")
                        }
                    }
                    
                    //add/drop classes prompts
                    Menu("Add/Drop Courses") {
                        Button("When does the add/drop period close?"){
                            sendMessage(message:"When does the add/drop period close?")
                        }
                        Button("How do I drop a class?"){
                            sendMessage(message:"How do I drop a class?")
                        }
                        Button("How do I add a class?"){
                            sendMessage(message:"How do I add a class?")
                        }
                    }
                    
                    //credits prompts
                    Menu("Credits") {
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
                        Button("How many credits do I need as an athlete?") {
                            sendMessage(message:"How many credits do I need as an athlete?")
                        }
                        Button("How many credits to be a full/part time student?") {
                            sendMessage(message:"How many credits to be a full/part time student?")
                        }
                    }
                    
                    //gpa prompts
                    Menu("GPA") {
                        Button("What GPA do I need as an honors student?"){
                            sendMessage(message:"What GPA do I need as an honors student?")
                        }
                        Button("What GPA do I need as an athlete?") {
                            sendMessage(message:"What GPA do I need as an athlete?")
                        }
                        Button("What is my GPA?") {
                            sendMessage(message:"What is my GPA?")
                        }
                        Button("At what GPA are you on academic probation?") {
                            sendMessage(message:"At what GPA are you on academic probation?")
                        }
                    }
                    
                    //contact info prompts
                    Menu("Contact Info") {
                        Button("Registrar Email"){
                            sendMessage(message:"Registrar Email")
                        }
                        Button("Registrar Phone") {
                            sendMessage(message:"Registrar Phone")
                        }
                        Button("Advisor Phone") {
                            sendMessage(message:"Advisor Phone")
                        }
                        Button("Advisor Email") {
                            sendMessage(message:"Advisor Email")
                        }
                    }
                }
                
                
                
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
        }.navigationBarBackButtonHidden(true)
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


