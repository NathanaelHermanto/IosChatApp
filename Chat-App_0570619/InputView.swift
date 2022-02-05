//
//  InputView.swift
//  Chat-App_0570619
//
//  Created by Nathan on 28.01.22.
//

import SwiftUI

struct InputView: View {
    let name: String
    @State private var message = ""
    @State private var isSender = true
    var body: some View {
        
        VStack {
            Text("Send your chat to \(name) here")
            TextField("Enter your message", text: $message)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                .padding()
                .onSubmit {
                    guard message.isEmpty == false else {
                        print("No message to send")
                        return
                    }
                    writeJSON(msg: message, sender: isSender, name: name)
                }
        
            Text("Message: \(message)")
                .padding()  
            Divider()
                .frame(width: 350)
            Toggle("Sender", isOn: $isSender)   
                .padding()
        }
        .background(Color.white)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InputView(name: "name")
        }
    }
}
