//
//  UIView+Ext.swift
//  GitSwift
//
//  Created by tm on 2017/8/4.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import Foundation
import CoreGraphics

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

extension UIImage {
    
    class func imageWithColor(color: UIColor?) -> UIImage? {
        assert(color != nil, "color is nil")
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor((color?.cgColor)!)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
}

class View: UIView {
    
}

class UnderLineView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawUnderLine()
    }
}

class UnderLineTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawUnderLine()
    }
}

class RadiusButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 2
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 2
        clipsToBounds = true
    }
    
}

extension UIView {
    
    func drawUnderLine() {
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 0, y: frame.height - UnderLineHeight))
        context?.addLine(to: CGPoint(x: frame.width, y: frame.height - UnderLineHeight))
        
        context?.setLineWidth(UnderLineHeight)
        context?.setStrokeColor((UIColor.white.cgColor))
        context?.setFillColor((UIColor.white.cgColor))
        context?.drawPath(using: .fillStroke)
    }
    
}
