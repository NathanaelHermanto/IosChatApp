//
//  JSONUtils.swift
//  Chat-App_0570619
//
//  Created by Nathan on 30.01.22.
//

import Foundation

func writeJSON(msg: String, sender: Bool, name: String) {
    
    let message = [["Message": msg], ["Name": name], ["Sender": sender]]

    if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                        in: .userDomainMask).first {
        let fileUrl = documentDirectory.appendingPathComponent("\(name)Chat.json")
        do {
            let data = try JSONSerialization.data(withJSONObject: message, options: [])
                    try data.write(to: fileUrl, options: [])
            print(fileUrl)
        } catch {
            print(error)
        }
    }
}

//func readJson(name: String) {
//    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//        let fileUrl = documentsDirectory.appendingPathComponent("\(name)Chat.json")
//
//        do {
//            let data = try Data(contentsOf: fileUrl, options: [])
//            guard let chat = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: [String: String]]] else { return }
//            print(data)
//        } catch {
//            print(error)
//        }
//}
