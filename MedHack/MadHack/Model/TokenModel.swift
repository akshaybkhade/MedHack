//
//  TokenModel.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit

class TokenModel: NSObject {

    static var tokenModel : TokenModel?
    var token : String?

    static func shareInstance () -> TokenModel
    {
        if(tokenModel == nil)
        {
           tokenModel = TokenModel()
            tokenModel?.token = "fcc050c37386e7fee56ba5a93c63c76251879060d04d56ec28206723d9873756"
        }
        return tokenModel!
    }
    
    func getToken() -> String
    {
       return "Bearer \(token!)"
    }
    
}
