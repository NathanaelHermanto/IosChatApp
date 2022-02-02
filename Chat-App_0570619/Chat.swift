//
//  Chat.swift
//  Chat-App_0570619
//
//  Created by Nathan on 30.01.22.
//

import Foundation

struct Message: Codable {
    var name: String
    var msg: String
    var sender: Bool
    
    init(message: String, sender: Bool, name: String){
        self.name = name
        self.msg = message
        self.sender = sender
    }

}

//struct ChatHistory: Codable {
//    var history: [Message] = []
//
//    mutating func addMessage(message: Message){
//        history.append(message)
//    }
//
//}
        
