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
    var body: some View {
        let chatData = readJSON(name: name)
        let chatHistory = decodeJSON(jsonData: chatData)
        
        
        NavigationView{
            VStack (alignment: isSender ? .trailing : .leading) {
                ZStack {
                    Color.init(UIColor.lightText)
                    VStack(alignment: .trailing) {
                        ForEach(chatHistory, id: \.self){ chat in
                            ChatBubble(message: chat.message == "error" ? "no message" : chat.message
                                       ,isSender: chat.sender)
                        }
                    }
                    
                }
                .padding()
                .shadow(color: Color.init(UIColor.lightGray), radius: 5)
                
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

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(name:"Bob")
    }
}
