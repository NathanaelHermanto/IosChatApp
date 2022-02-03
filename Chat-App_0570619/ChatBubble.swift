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
            .padding()
            .foregroundColor(isSender ? Color.white : Color.black)
            .background(isSender ? Color.blue : Color.init(UIColor.lightGray))
            .cornerRadius(15)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(message: "Hallo Hallo", isSender: true)
    }
}
