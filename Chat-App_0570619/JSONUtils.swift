//
//  JSONUtils.swift
//  Chat-App_0570619
//
//  Created by Nathan on 30.01.22.
//

import Foundation

func writeJSON(msg: String, sender: Bool, name: String) {
    let jsonString = "{\"message\": \"\(msg)\", \"sender\": \"\(sender)\"}"

    if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                        in: .userDomainMask).first {
        let pathWithFilename = documentDirectory.appendingPathComponent("\(sender)Chat.json")
        do {
            try jsonString.write(to: pathWithFilename,
                                 atomically: true,
                                 encoding: .utf8)
        } catch {
            // Handle error
        }
    }
}

