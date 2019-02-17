//
//  WebServiceConstant.swift
//  SwiftStructure
//
//  Created by Pravin on 10/10/16.
//  Copyright © 2016 com.perennial. All rights reserved.
//

import Foundation
import Alamofire

struct WebConstants {
    private init(){}
    
    
    
    struct symptoms
    {
        static let path = "diseases?page=1&size=1000";
        static let method = HTTPMethod.get
    }
    struct symptomsResult
    {
        static let path = "oauth2";
        static let method = HTTPMethod.get
    }
    
    struct medicine
    {
        static let path = "medicines/brands?page=6&size=100";
        static let method = HTTPMethod.get
    }
    struct medicineAletnative
    {
        static let path = "";
        static let method = HTTPMethod.post
    }
    
    struct imageToText
    {
        static let path = "medhack/get_text";
        static let method = HTTPMethod.post
    }
}
//MARK: Error status code

struct WebServiceErrorCode {
    private init(){}
    let WS_ERROR_CODE_TIMEOUT                  =        -1001
    let WS_ERROR_CODE_CANNOT_CONNECT_TO_HOST   =        -1004
    let WS_ERROR_CODE_NETWORK_CONNECTION_LOST  =        -1005
    let WS_ERROR_CODE_INTERNET_CONNECTION      =        -1009
    let WS_NO_HOST_FOUND                       =        -1003
    let WS_ERROR_CODE_SESSION_EXPIRED          =         1013
    let WS_ERROR_CODE_PHONE_NUMBER_EXIST       =         1012
}

//STATUS CODE

let API_SUCCESS_CODE                        = 200
let API_JSON_EMPTY_CODE                     = 901

//ERROR DOMAIN
let JSON_EMPTY_DOMAIN                       = "JSON EMPTY"
let API_FAILURE_DOMAIN                      = "API Failure"

//MARK: Webservice Keys
let WS_STATUS                           =  "status"
let WS_SUCCESS                          =  true
let WS_FAILURE                          =  false
let WS_DATA                             =  "data"
let WS_ERROR                            =  "error"

