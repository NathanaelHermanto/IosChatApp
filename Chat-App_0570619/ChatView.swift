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
        NavigationView{
            NavigationLink(destination: InputView(name: name)) {
                    Image(systemName: "plus.message.fill")
                        .resizable()
                        .frame(width: 48.0, height: 48.0)
                        .position(x: 310, y: 525)
                        .padding()
                }
                .navigationTitle(name)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(name:"name")
    }
}
