//
//  JSONUtils.swift
//  Chat-App_0570619
//
//  Created by Nathan on 30.01.22.
//

import Foundation

func getPath(name: String) -> URL{
    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        return URL(fileURLWithPath: "error")
    }
    let fileUrl = documentsDirectory.appendingPathComponent("\(name)Chat.json")
    return fileUrl
}

func writeJSON(msg: String, sender: Bool, name: String) {
    let message: Message = Message(message: msg, sender: sender, name: name)
    let fileUrl = getPath(name: name)
    
    var chatHistory: [Message] = {
        do {
            let data = try Data(contentsOf: fileUrl)
            let decoder = JSONDecoder()
            let messages = try decoder.decode([Message].self, from: data)
            return messages
        } catch {
            print(error.localizedDescription)
            return []
        }
    }()
    
    chatHistory.append(message)
    
    do {
        let encodeStringMessage = encodeJSON(message: chatHistory)
        try encodeStringMessage.write(to: fileUrl, atomically: true, encoding: .utf8)
        print(fileUrl)
    } catch {
        print(error)
    }
}

func readJSON(name: String) -> String {
    let fileUrl = getPath(name: name)
    let jsonDecoder = JSONDecoder()
    
    do {
        let data = try Data(contentsOf: fileUrl, options: [])
        let decodedMessage = try jsonDecoder.decode([Message].self, from: data)
        return encodeJSON(message: decodedMessage)
    } catch {
        return "No chat"
    }
    
}

func encodeJSON(message: [Message]) -> String {
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    
    do {
        let encodeMessage = try jsonEncoder.encode(message)
        let encodeStringMessage = String(data: encodeMessage, encoding: .utf8)!
        return encodeStringMessage
    } catch {
        return "error"
    }
}

func decodeJSON(jsonData: String) -> [Message] {
    do {
        let data = Data(jsonData.utf8)
        let decodedJSON = try JSONDecoder().decode([Message].self, from: data)
        return decodedJSON
    } catch {
        return [Message(message: "error", sender: false, name: "error")]
    }
}
