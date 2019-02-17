//
//  Enum.swift
//  MyWallet
//
//  Created by Pravin on 24/10/17.
//  Copyright © 2017 com.perennial. All rights reserved.
//

import Foundation

enum NETWORK_STATUS {
    
    case NETWORK_STATUS_AVAILABLE
    case NETWORK_STATUS_AVAILABLE_SERVER_DEAD
    case NETWORK_STATUS_NOT_AVAILABLE
}

enum NetworkStatus : Int {
    
    case NotReachable = 0
    case ReachableViaWiFi
    case ReachableViaWWAN
}

enum ValidationState : Equatable{
    
    case valid
    case inValid(String)
}

func ==(lhs: ValidationState, rhs: ValidationState)->Bool {
    
    switch (lhs,rhs) {
    case (.valid,.valid):
        return true
    case (let .inValid(b),let .inValid(a)) :
        return a == b
    default:
        return false
    }
}

enum MENU_OPTION : Int {
    
    case LANGUAGE_CHANGE_OPTION = 0
    case HOME_OPTION
    case LIST_CELL_OPTION
}

enum USER_LANGUAGE : Int {
    
    case ENGLISH = 0
    case OTHER
}

enum LoginSelectedTab : Int {
    
    case LOGIN_SCREEN_DEFAULT_SELECTED_TAB = 0
    case LOGIN_SCREEN_SIGN_UP_SELECTED_TAB
}

enum TransactionHistorySelectedTab : Int {
    
    case ALL = 0
    case SETTLED
    case REVERSED
    case CANCELLED
}



