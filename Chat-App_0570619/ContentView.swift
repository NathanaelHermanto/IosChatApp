//
//  ContentView.swift
//  Chat-App_0570619
//
//  Created by Nathan on 28.01.22.
//

import SwiftUI



struct ContentView: View {
    @State var name: String = ""
    @State var chatPartners: [String] = [
       "Maria",
       "Bob",
       "Carl"
    ]
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Color.init(UIColor.lightGray)
                    VStack(spacing: 30){
                        Text("Contacts")
                        ForEach(chatPartners, id: \.self){
                            chatPartner in
                            NavigationLink(destination: ChatView(name: chatPartner)) {
                                Text(chatPartner)
                            }
                        }
                    }
                    .navigationTitle("Chats")
                }
                .padding()
                .shadow(color: Color.init(UIColor.lightGray), radius: 5)
                
                Text("Add Contact")
                TextField("Enter the name ", text: $name)
                    .padding()
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                    .padding()
                    .onSubmit {
                        chatPartners.append(name)
                        print(chatPartners)
                    }
                    
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
