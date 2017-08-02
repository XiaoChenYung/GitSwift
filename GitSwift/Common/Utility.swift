//
//  Utility.swift
//  GitSwift
//
//  Created by tm on 2017/8/2.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    convenience init(hex: String) {
        var cString = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString = cString.substring(from: "#".endIndex)
        }
        var index = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: index)
        let range = Range(uncheckedBounds: (lower: cString.index(cString.startIndex, offsetBy: 2), upper: cString.index(cString.startIndex, offsetBy: 4)))
        let gString = cString.substring(with: range)
        index = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: index)
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        Scanner(string: rString).scanHexInt32(&r)
		Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        let sub: CGFloat = 255
        self.init(red: CGFloat(r)/sub, green: CGFloat(g)/sub, blue: CGFloat(b)/sub, alpha: 1.0)
    }
    
}


