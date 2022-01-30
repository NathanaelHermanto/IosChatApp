//
//  Chat.swift
//  Chat-App_0570619
//
//  Created by Nathan on 30.01.22.
//

import Foundation

struct Message {
    var msg: String
    var sender: Bool
    
    init(message: String, sender: Bool){
        self.msg = message
        self.sender = sender
    }

}
        
