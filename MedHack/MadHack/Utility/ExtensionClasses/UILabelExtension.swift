//
//  UILabelExtension.swift
//  ExtensionClasses
//
//  Created by Shekhar on 4/14/17.
//  Copyright © 2017 perennial. All rights reserved.
//

import UIKit
import Foundation

extension UILabel{
     
    func getTextSize(_ font : UIFont,maxWidth : CGFloat) -> CGSize? {
        
        return self.text?.getTextSize(font, maxWidth: maxWidth)
    }
    
    func setAmountText(amount : String?,size : CGFloat? = nil){
    
        guard let main_string = amount else{
            self.text = ""
            return
        }
        let currency = Config.DEFAULT_CURRENCY
        let range = (main_string as NSString).range(of: currency)
        var fontSize = size ?? self.font.pointSize
        fontSize = fontSize - 4
        let fontName = self.font.fontName
        let newFont = UIFont.circularStdFontWithName(name: fontName, size: fontSize)
        let attribute = NSMutableAttributedString.init(string: main_string)
        attribute.addAttribute(NSAttributedString.Key.font, value: newFont , range: range)
        self.attributedText = attribute
    }
}
