//
//  ChatView.swift
//  Chat-App_0570619
//
//  Created by Nathan on 28.01.22.
//

import SwiftUI

struct ChatView: View {
    var name: String
    
    var body: some View {
        let chatData = readJSON(name: name)
        
        NavigationView{
            VStack{
                
                
                Text(chatData)
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                
                NavigationLink(destination: InputView(name: name)) {
                        Image(systemName: "plus.message.fill")
                            .resizable()
                            .frame(width: 48.0, height: 48.0)
                            .offset(x: 125)
                            .padding()
                    }
                    .navigationTitle(name)
    
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(name:"name")
    }
}
