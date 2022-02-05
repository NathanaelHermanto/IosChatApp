//
//  ChatView.swift
//  Chat-App_0570619
//
//  Created by Nathan on 28.01.22.
//

import SwiftUI

struct ChatView: View {
    var name: String
    @State var isSender = true
    @State var chatHistory: [Message]

    init(name: String){
        self.name = name
        chatHistory = decodeJSON(jsonData: readJSON(name: name))
    }
    
    var body: some View {
        NavigationView{
            VStack (alignment: .trailing) {
                ZStack {
                    Color.init(UIColor.lightText)
                    ScrollView{
                        VStack(alignment: .trailing) {
                            ForEach(chatHistory, id: \.self){ chat in
                                ChatBubble(message: chat.message == "error" ? "no message" : chat.message
                                           ,isSender: chat.sender)
                                    .frame(idealWidth: 100, maxWidth: .infinity, alignment: chat.sender ? .trailing : .leading)
                                    .padding(chat.sender ? .trailing : .leading, 10)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
                .padding()
                .shadow(color: Color.init(UIColor.lightGray), radius: 5)
                
                
                HStack{
                    Button("reload chat"){
                        chatHistory = decodeJSON(jsonData: readJSON(name: name))
                    }
                    .frame(width: 100, alignment: .leading)
                    .padding(.trailing, 200)
                    
                    NavigationLink(destination: InputView(name: name)) {
                        Image(systemName: "plus.message.fill")
                            .resizable()
                            .frame(width: 48.0, height: 48.0)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                    }
                    .navigationTitle(name)
                }
                
    
            }
        }
    }
    
    func reloadMessages() {
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(name: "Bob")
    }
}
