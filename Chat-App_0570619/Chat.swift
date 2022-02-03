//
//  Chat.swift
//  Chat-App_0570619
//
//  Created by Nathan on 30.01.22.
//

import Foundation

struct Message: Codable, Hashable {
    var name: String
    var message: String
    var sender: Bool
    
    init(message: String, sender: Bool, name: String){
        self.name = name
        self.message = message
        self.sender = sender
    }

}

