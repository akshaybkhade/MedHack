//
//  Environment.swift
//  MyWallet
//
//  Created by Perennial on 09/01/18.
//  Copyright © 2018 com.perennial. All rights reserved.
//


import Foundation

public enum PlistKey {
    case BaseUrl
    case APIVersion
    case HostUrl
    case emailEndPoint
    case s3Url
    case header
    case appVersion
    case appBuildVersion
    case consumerKey
    
    func value() -> String {
        switch self {
        case .BaseUrl:
            return "BASE_URL"
        case .APIVersion:
            return "API_VERSION"
        case .HostUrl:
            return "HOST_URL"
        case .emailEndPoint:
            return "EMAIL_END_POINT"
        case .s3Url:
            return "S3_URL"
        case .header:
            return "HEADER"
        case .appVersion:
            return "CFBundleShortVersionString"
        case .appBuildVersion:
            return "CFBundleVersion"
        case .consumerKey:
            return "CONSUMER_KEY"
            
        }
    }
}

public struct Environment {
    
    fileprivate var infoDict: [String: Any]  {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            }else {
                fatalError("Plist file not found")
            }
        }
    }
    
    public func configuration(_ key: PlistKey) -> String {
        
        switch key {
        case .BaseUrl:
            return infoDict[PlistKey.BaseUrl.value()] as! String
        case .APIVersion:
            return infoDict[PlistKey.APIVersion.value()] as! String
        case .HostUrl:
            return infoDict[PlistKey.HostUrl.value()] as! String
        case .emailEndPoint:
            return infoDict[PlistKey.emailEndPoint.value()] as! String
        case .s3Url:
            return infoDict[PlistKey.s3Url.value()] as! String
        case .header:
            return infoDict[PlistKey.header.value()] as! String
        case .appVersion:
            return infoDict[PlistKey.appVersion.value()] as! String
        case .appBuildVersion:
            return infoDict[PlistKey.appBuildVersion.value()] as! String
        case .consumerKey:
            return infoDict[PlistKey.consumerKey.value()] as! String
        }
    }
}
