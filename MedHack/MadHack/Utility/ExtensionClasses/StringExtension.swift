//
//  StringExtension.swift
//  ExtensionClasses
//
//  Created by Shekhar on 4/14/17.
//  Copyright © 2017 perennial. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func length() -> Int {
        return self.characters.count
    }
    
    func int() ->  Int? {
        let num = Int(self)
        if num != nil {
            return num
        }
        else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        
        if(self.length() == 0 ){
            return true;
        }
        return false;
    }
    
    func getLastChar() -> String {
        
        if self == "" {
            return ""
        }
        else {
            return "\(String(describing: self.characters.last))"
        }
    }
    
    func isLastChatDot() -> Bool {
        
        return (self.getLastChar() == ".")
    }
    
    func isContainDot() -> Bool {
        
        let dot = "."
        
        let range = self.range(of: dot)
        
        if range != nil {
            return true
        }
        else {
            return false
        }
    }
    
    func isContainSmallCharector() -> Bool {
        let smallLetterRegEx  = ".*[a-z]+.*"
        let smalltest = NSPredicate(format:"SELF MATCHES %@", smallLetterRegEx)
        let smallResult = smalltest.evaluate(with: self)
        return smallResult
    }
    
    func isContainCapitalCharector() -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: self)
        return capitalresult
    }
    
    func isContainNumber() -> Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: self)
        return numberresult;
    }
    
    func isContainAlphabetsOnly() -> Bool {
        for chr in self.characters {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
                return false
            }
        }
        return true
    }
    
    //is contain white space
    func isContainwhitespace() -> Bool  {
        
        let whitespace = CharacterSet.whitespaces
        let range = self.rangeOfCharacter(from: whitespace)
        if range != nil {
            return true
        }
        else {
            return false
        }
    }
    
    func isContainSpecialCharector() -> Bool {
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = texttest2.evaluate(with: self)
        return specialresult
    }
    
    func isAlphaNumaric() -> Bool{
        return self.isContainNumber() && (self.isContainSmallCharector() || self.isContainCapitalCharector())
    }
    
    func isNumber() -> Bool {
        return !self.isEmpty && self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    func isEqual(_ string : String) -> Bool {
        if(self == string){
            return true;
        }
        return false;
    }
    
    func getTextSize(_ font : UIFont, maxWidth : CGFloat ) -> CGSize {
        let constraintRect = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font,NSAttributedString.Key.paragraphStyle : paragraph], context: nil)
        return boundingBox.size
    }
    
    func isValidString(newString: String, location: Int) -> Bool {
        
        if self.getCharOfIndex(index: location) == newString {
            return false
        } else if(self.getCharOfIndex(index: location - 1) == newString) {
            return false
        }
        return true
    }
    
    func getCharOfIndex(index : Int) -> String {
        
        if index >= self.length() || index < 0 {
            
            return ""
        }
        
        let nsRange = NSMakeRange(index,1)
        let range = self.index(self.startIndex, offsetBy: nsRange.location)..<self.index(self.startIndex, offsetBy: nsRange.location + nsRange.length)
        
        let char = String(self[range])
        return char
    }
    
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: Data(utf8),
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }

    
}
