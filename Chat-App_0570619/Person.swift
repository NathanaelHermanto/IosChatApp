//
//  Person.swift
//  Chat-App_0570619
//
//  Created by Nathan on 04.02.22.
//

import Foundation
import UIKit

struct Person: Hashable {
    var id: Int
    var name: String
    var color: UIColor
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
        self.color = UIColor.random()
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
