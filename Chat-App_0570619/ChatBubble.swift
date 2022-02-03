//
//  ChatBubble.swift
//  Chat-App_0570619
//
//  Created by Nathan on 03.02.22.
//

import SwiftUI

struct ChatBubble: View {
    var message: String
    var isSender: Bool
    var body: some View {
        
        Text(message)
                    .padding(10)
                    .foregroundColor(Color.white)
                    .background(isSender ? Color.blue : Color.gray)
                    .cornerRadius(10)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(message: "Hallo Hallo", isSender: true)
    }
}
