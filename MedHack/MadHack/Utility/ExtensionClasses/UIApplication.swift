//
//  UIApplication.swift
//  MyWallet
//
//  Created by Perennial  on 20/01/18.
//  Copyright © 2018 com.perennial. All rights reserved.
//

import Foundation
import LocalAuthentication


enum AuthenticationType : Int{
    
    case faceId
    case fingerPrint
    case passcode
    case none
}


enum iPhoneType : Int{
    case iPhone5
    case iPhone6       //Same for iPhone6s,iPhone7,iPhone8
    case iPhone6Plus   //Same for iPhone6sPlus,iPhone7Plus,iPhone8Plus
    case iPhoneX
    case none
}

