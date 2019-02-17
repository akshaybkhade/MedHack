//
//  UserManager.swift
//  MyWallet
//
//  Created by Developer on 02/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
//TODO : Remove Object Mapper and Add Cadable

//TODO: We can move these all errors to parent enums
enum UserManagerErrors:Error {
   
}

enum UserManagerResult<T>{
    case success(result: T)
    case failure(error:UserManagerErrors)
}

//typealias LoginCompletionHandler = (_ result: UserManagerResult<LoginResponseDTO>) -> Void


class UserManager: NSObject {
    fileprivate static var mInstance:UserManager = UserManager()
    fileprivate let userNWService = UserNWService()
    fileprivate let userDBService = UserDBService()
    
}

