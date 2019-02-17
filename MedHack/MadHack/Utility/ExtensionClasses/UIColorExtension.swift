//
//  UIColorExtension.swift
//  ExtensionClasses
//
//  Created by Shekhar on 4/14/17.
//  Copyright © 2017 perennial. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    //Get
    class func rgbColor(red : CGFloat,green : CGFloat,blue : CGFloat,alpha : CGFloat) -> UIColor {
        return UIColor(red : red/255.0, green:green/255.0,blue : blue/255.0, alpha : alpha)
    }
    
    //Get color from 1 integer value
    public convenience init?(value : CGFloat,alpha : CGFloat) {
       
        self.init(red: value/255.0, green: value/255.0, blue: value/255.0, alpha: alpha)
    }
    
    //Get Color from hex code
    public convenience init?(hexStringValue: String) {

        let r, g, b, a: CGFloat
        if hexStringValue.hasPrefix("#") {
            let start = hexStringValue.index(hexStringValue.startIndex, offsetBy: 1)
            let hexColor = String(hexStringValue[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }else if hexColor.count == 6{
                
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                   
                    r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x000000ff) / 255
                    a = 1.0
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
    
}
