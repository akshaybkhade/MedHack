//
//  UIFontExtension.swift
//  ExtensionClasses
//
//  Created by Shekhar on 4/18/17.
//  Copyright © 2017 perennial. All rights reserved.
//

import UIKit
import Foundation

extension UIFont {
    
    class func circularStdFontWithSize(size: CGFloat) -> UIFont {
        
        return UIFont(name: "CircularStd-Book", size: size)!
    }

    class func rupeeForadianFontWithSize(size: CGFloat) -> UIFont {
        
        return UIFont(name: "CircularStd-Book", size: size)!
    }

    class func circularStdMediumFontWithSize(size: CGFloat) -> UIFont {
        
        return UIFont(name: "CircularStd-Medium", size: size)!
    }
    
    class func circularStdBoldFontWithSize(size: CGFloat) -> UIFont {
        
        return UIFont(name: "CircularStd-Bold", size: size)!
    }
    
    class func circularStdFontWithName(name : String?,size: CGFloat) -> UIFont {
        
        guard let fontName = name, let font = UIFont(name: fontName, size: size) else {
            return UIFont.circularStdBoldFontWithSize(size: size)
        }
        return font
    }
}
