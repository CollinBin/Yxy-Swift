//
//  UIColor+Hex.swift
//  Yxy-Swift
//
//  Created by songbincheng on 29/12/2017.
//  Copyright © 2017 宋滨诚. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat) {
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let length = (cString as NSString).length
        if (length != 6 || (!cString.hasPrefix("#") && length == 7)) {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: alpha)
            return
        }
        if cString.hasPrefix("#") {
            cString = (cString as NSString).substring(from: 1)
        }
        
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
}
