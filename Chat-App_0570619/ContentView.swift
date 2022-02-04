//
//  ContentView.swift
//  Chat-App_0570619
//
//  Created by Nathan on 28.01.22.
//

import SwiftUI



struct ContentView: View {
    @State var name: String = ""
    @State var chatPartners: [Person] = [
        Person(id: 1, name: "Maria"),
        Person(id: 2, name: "Bob"),
        Person(id: 3, name: "Carl"),
        Person(id: 4, name: "Ron"),
    ]
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Color.init(UIColor.lightText)
                    VStack(spacing: 30){
                        Text("Contacts")
                            .padding()
                        HStack(alignment: .bottom, spacing: 5) {
                            VStack{
                                ForEach(chatPartners, id: \.self){
                                    chatPartner in
                                    if(isOdd(number: chatPartner.id)){
                                        NavigationLink(destination: ChatView(name: chatPartner.name)) {
                                            Text(chatPartner.name.prefix(2))
                                                .padding()
                                                .foregroundColor(Color.white)
                                                .background(Color.init(chatPartner.color))
                                                .cornerRadius(90)
                                                .padding(5)
                                        }
                                    }
                                }
                            }
                            
                            VStack{
                                ForEach(chatPartners, id: \.self){
                                    chatPartner in
                                    if(!isOdd(number: chatPartner.id)){
                                        NavigationLink(destination: ChatView(name: chatPartner.name)) {
                                            Text(chatPartner.name.prefix(2))
                                                .padding()
                                                .foregroundColor(Color.white)
                                                .background(Color.init(chatPartner.color))
                                                .cornerRadius(90)
                                                .padding(5)
                                        }
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    .navigationTitle("Chats")
                }
                .padding()
                .shadow(color: Color.init(UIColor.lightGray), radius: 5)
                
                Text("Add Contact")
                    .frame(idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 17)
                TextField("Enter the name ", text: $name)
                    .padding()
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                    .padding(.init(top: 0, leading: 17, bottom: 17, trailing: 17))
                    .onSubmit {
                        let id = chatPartners.last!.id + 1
                        chatPartners.append(Person(id: id, name: name))
                    }
                    
            }
            
        }
    }
}

func isOdd(number: Int) -> Bool {
    return number%2 != 0
}

func partnerList(chatPartner: Person) -> NavigationLink<Text, ChatView> {
    return NavigationLink(destination: ChatView(name: chatPartner.name)) {
        Text(chatPartner.name.prefix(2))
            .padding()
            .foregroundColor(Color.white)
            .background(Color.init(chatPartner.color))
            .cornerRadius(90)
            .padding(5) as! Text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
