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
        Person(id: 5, name: "Harry"),
        Person(id: 6, name: "Newt"),
        Person(id: 7, name: "Tony"),
        Person(id: 8, name: "Steve"),
        Person(id: 9, name: "Natasha"),
        Person(id: 10, name: "Clint"),
    ]
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Color.init(UIColor.lightText)
                    ScrollView {
                        VStack(spacing: 30){
                            HStack(alignment: .top, spacing: 55) {
                                VStack{
                                    ForEach(chatPartners, id: \.self){
                                        chatPartner in
                                        if(isOdd(number: chatPartner.id)){
                                            NavigationLink(destination: ChatView(name: chatPartner.name)) {
                                                Text(chatPartner.name.prefix(2))
                                                    .padding(25)
                                                    .foregroundColor(Color.white)
                                                    .background(Color.init(chatPartner.color))
                                                    .cornerRadius(90)
                                                    .padding(EdgeInsets(top: 5, leading: 25, bottom: 5, trailing: 0))
                                                    .font(.system(size: 25, weight: .medium))
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
                                                    .padding(25)
                                                    .foregroundColor(Color.white)
                                                    .background(Color.init(chatPartner.color))
                                                    .cornerRadius(90)
                                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 25))
                                                    .font(.system(size: 25, weight: .medium))
                                            }
                                        }
                                    }
                                }
                                
                            }
                            
                        }
                    }
                    .navigationTitle("Chats")
                    .padding(EdgeInsets(top: 25, leading: 0, bottom: 25, trailing: 0))
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
                        guard name.isEmpty == false else {
                            print("Name is empty")
                            return
                        }
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
