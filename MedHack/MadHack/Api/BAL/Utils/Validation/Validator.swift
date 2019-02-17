//
//  LoginRequestDTO.swift
//  MyWallet
//
//  Created by Developer on 02/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//


import Foundation

public enum ValidatorRule: Equatable {
    
    case valid
    case required
    case email
    case minLengthPassword
    case maxLengthPassword
    case oneCapitalLetter
    case oneSmallLetter
    case oneSpecialCharector
    case oneNumber
    case phoneNumber
    case alphabet
    case zipCode
    case alphaNumericWithSpace
    case maxLength(Int)
    case minLength(Int)
    case decimal(Int)
    case regex(String)
    case custom((String) -> Bool)
}

public func ==(lhs: ValidatorRule, rhs: ValidatorRule)->Bool {

    switch (lhs,rhs) {
        case (.valid,.valid):
            return true
        case (.required,.required):
            return true
        case (.email,.email):
            return true
        case (.minLengthPassword,.minLengthPassword):
            return true
        case (.maxLengthPassword,.maxLengthPassword):
            return true
        case (.phoneNumber,.phoneNumber):
            return true
        case (.zipCode,.zipCode):
            return true
        case (let .regex(a),let .regex(b)):
            return a == b
        default:
            return false
        }
    
}

public class Validator {
    private static let PASSWORD_MIN_LENGTH :Int = 8
    private static let PASSWORD_MAX_LENGTH :Int = 100
    public  static var FIELD_MIN_LENGTH    : Int = 0
    public  static var FIELD_MAX_LENGTH    : Int = 1000

    public class func validate(_ testString: String?, rules: [ValidatorRule]) -> ValidatorRule {
        if testString == nil || testString!.isEmpty {
            var requiresContent = false
            for rule in rules {
                switch rule {
                case .required: requiresContent = true
                default: break
                }
            }
            if !requiresContent {
                return .valid
            }
        }
        
        guard let testString = testString else {
            return .required
        }
        
        for rule in rules {
            switch rule {
            case .required where testString.isEmpty: return rule
            case .email where !isValidEmailAddress(testString): return rule
            case .phoneNumber where !isValidPhoneNumber(testString): return rule
            case .zipCode where !isValidZipCode(testString): return rule
            case .regex(let regex) where !matchesRegex(testString, regex:regex): return rule
            case .minLengthPassword where !isLengthValidForMinPassword(testString): return rule
            case .alphabet where !isContainAlphabetOnly(testString): return rule
            case .maxLengthPassword where !isLengthValidForMaxPassword(testString): return rule
            case .minLength(let minLenght) where !isLengthValidForMinField(testString,minLength: minLenght): return rule
            case .maxLength(let maxLenght) where !isLengthValidForMaxField(testString,maxLength: maxLenght): return rule
            case .decimal(let decimal) where !isValidDecimalInput(testString : testString, numberOfDecimals : decimal): return rule
            case .oneCapitalLetter where !isContainAtLeastOneCapitalLetter(testString): return rule
            case .oneSmallLetter where !isContainAtLeastOneSmallLetter (testString): return rule
            case .oneNumber where !isContainAtLeastOneNumber(testString): return rule
            case .oneSpecialCharector where !isContainAtLeastOneSpecialCharector(testString): return rule
            case .custom(let closure) where !closure(testString): return rule
                
            case .alphaNumericWithSpace where !isContainAlphaNumericWithSpace(testString) : return rule

            default: break
            }
        }
        return .valid
    }
    
    private class func isValidEmailAddress(_ testString: String) -> Bool {
        
        let emailRegEx = "^\\s*[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}\\s*$"
        
        return matchesRegex(testString, regex: emailRegEx)
    }
    
    private class func isValidPhoneNumber(_ testString: String) -> Bool {
        return true;
    }
    
    private class func isValidZipCode(_ testString:String) -> Bool
    {
        let zipRegex = "^\\s*[0-9]{5}(?:-[0-9]{4})?\\s*$"
        return matchesRegex(testString, regex: zipRegex)
    }
    
    private class func matchesRegex(_ testString: String, regex: String) -> Bool{
        return testString.range(of: regex, options: .regularExpression) != nil
    }
    
    private class func isLengthValidForMinPassword(_ password:String)-> Bool {
        if (password.length() >= PASSWORD_MIN_LENGTH){
            return true
        }
        return false
    }
    
    private class func isLengthValidForMaxPassword(_ password:String)-> Bool {
        if (password.length() <= PASSWORD_MAX_LENGTH){
            return true
        }
        return false
    }
    
    private class func isLengthValidForMinField(_ string:String,minLength : Int)-> Bool {
        if (string.length() >= minLength){
            return true
        }
        return false
    }
    
    private class func isLengthValidForMaxField(_ string:String,maxLength : Int)-> Bool {
        if (string.length() <= maxLength){
            return true
        }
        return false
    }
    
    private class func isContainAlphabetOnly(_ testString:String)-> Bool {
        let specialChar = isContainAtLeastOneSpecialCharector(testString)
        let number = isContainAtLeastOneNumber(testString)
        return specialChar != true && number != true
    }
    
    private class func isContainAtLeastOneSmallLetter(_ testString:String)-> Bool {
        let capitalLetterRegEx  = ".*[a-z]+.*"
        return matchesRegex(testString, regex: capitalLetterRegEx)
    }
    
    private class func isContainAtLeastOneCapitalLetter(_ testString:String)-> Bool {
        
         let capitalLetterRegEx  = ".*[A-Z]+.*"
         return matchesRegex(testString, regex: capitalLetterRegEx)
    }
    
    private class func isContainAtLeastOneSpecialCharector(_ testString:String)-> Bool {
        
        let set = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMONPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ").inverted
        return !(testString.rangeOfCharacter(from: set) == nil)
    }
    
    private class func isContainAtLeastOneNumber(_ testString:String)-> Bool {
        
        let numberRegEx  = ".*[0-9]+.*"
        return matchesRegex(testString, regex: numberRegEx)
    }

    private class func isContainAlphaNumericWithSpace(_ testString:String)-> Bool {
      
        let specialChar = isContainAtLeastOneSpecialCharector(testString)
        return !specialChar
    }

    private class func isValidDecimalInput(testString:String, numberOfDecimals : Int) -> Bool {
        
        let regEx = "^[0-9]+(?:\\.[0-9]{0,\(numberOfDecimals)})?$"
        return matchesRegex(testString, regex: regEx)
    }
    
}

