//
//  UserDBService.swift
//  MyWallet
//
//  Created by Developer on 02/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

struct UserModelDBKeys {
    
    static let user                  = "User"
    static let wallet                = "Wallet"
    static let billingAddress        = "billingAddress"
    static let resedentialAddress    = "resedentialAddress"
    static let kycVarificationStatus = "kycVarificationStatus"
    static let enumaration           = "enumaration"
    static let progressWidget        = "progressWidget"
    static let isUserLoggedIn        = "isUserLoggedIn"
    static let loyaltyPoints           = "loyaltyPoints"
    static let firebaseConfig           = "firebaseConfig"
    static let isBiometricAuthenticationEnble = "isBiometricAuthenticationEnble"
    static let userPassword           = "userPassword"
}

import Foundation

class UserDBService: NSObject {
    
    var userPassword : String?
    var isProgressWidgetDismiss        =  false
    var isBiometricAuthenticationEnble        =  true
    var isUserLoggedIn                  : Bool = false
   
    override init() {
     super.init()
        let handler = DBHandler()
        let userString = handler.getDataFor(key: UserModelDBKeys.user)
       
        
        let progessWidget = handler.getDataFor(key: UserModelDBKeys.progressWidget)
        if progessWidget != nil && progessWidget == "true"{
            isProgressWidgetDismiss = true
        }
        
        let isBiometricenable = handler.getDataFor(key: UserModelDBKeys.isBiometricAuthenticationEnble)
        if isBiometricenable != nil && isBiometricenable == "true"{
            isBiometricAuthenticationEnble = true
        }
        else {
            isBiometricAuthenticationEnble = false
        }
        let userLoggedIn = handler.getDataFor(key: UserModelDBKeys.isUserLoggedIn)
        
        if userLoggedIn != nil && userLoggedIn == "true"{
            isUserLoggedIn = true
        }
        userPassword = handler.getDataFor(key: UserModelDBKeys.userPassword)
    }
    
    
}
