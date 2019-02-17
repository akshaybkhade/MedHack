//
//  Constants.swift
//  SwiftComponentsDemo
//
//  Created by Perennial on 19/04/17.
//  Copyright © 2017 perennial. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    
    private init(){}
    static let PROJECT_NAME           = "MyWallet"
    static let SCREEN_HEIGHT          = UIScreen.main.bounds.size.height
    static let SCREEN_WIDTH           = UIScreen.main.bounds.size.width
    static let STATUS_BAR_HEIGHT      =       20.0
    static let IS_IPHONE_4            =     (SCREEN_HEIGHT < 568.0)
    static let MENU_VIEW_WIDTH        =     (SCREEN_WIDTH * 0.6667)
    static let ANIMATION_PRESENT_TIME = 0.25

    struct Timer {
        static let OTP_RESEND_TIME         = 30.0
        static let LOGIN_SCREEN_SHOW_TIME  = 10.0
    }
    
    struct Opacity{
        private init(){}
        static let hundred    = "FF"
        static let nintyFive  = "f2"
        static let ninty      = "E6"
        static let eightFive  = "D9"
        static let eighty     = "CC"
        static let sentyFive  = "BF"
        static let seventy    = "B3"
        static let sixtyFive  = "A6"
        static let sixty      = "99"
        static let fiftyFive  = "8C"
        static let fifty      = "80"
        static let fourtyFive = "73"
        static let fourty     = "66"
        static let thirtyFive = "59"
        static let thirty     = "4D"
        static let twentyFive = "40"
        static let twenty     = "33"
        static let fifteen    = "26"
        static let ten        = "1A"
        static let five       = "0D"
        static let zero       = "00"
    }
}

struct VIEW_CONTROLLER {
    
    private init(){}
    static let LOGIN_VC                   = "LoginViewController"
    static let SIGN_UP_VC                 = "SignUpViewController"
    static let FORGOT_PASSWORD_MOBILE_VC  = "ForgotPasswordMobileViewController"
    static let FORGOT_PASSWORD_PIN_VC     = "ForgotPasswordPinViewController"
    static let CHANGE_PASSWORD_VC         = "ChangePasswordViewController"
    static let CHANGE_PASSWORD_SUCCESS_VC = "ChangePasswordSuccessViewController"
    static let LOAD_UNLOAD_VC             = "LoadUnloadViewController"
    static let LOAD_UNLOAD_SUCCESS_VC     = "LoadUnloadSuccessViewController"
    static let LOAD_UNLOAD_FAILURE_VC     = "LoadUnloadFailureViewController"
    static let WEB_VIEW_CONTROLLER        = "WebViewController"

}

struct STORYBOARD {
    
    private init(){}
    static let MAIN          = "Main"
    static let LOGIN         = "Login"
    static let LOAD_UNLOAD   = "LoadUnload"
    static let DASHBOARD     = "Dashboard"
}
