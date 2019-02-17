//
//  NetworkServicxe.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit
import Alamofire
class MedNetworkService: NSObject {

    func performGetSymptoms(completion:@escaping(_ result: [SymptomModel], _ error : String ) -> Void){
        let apiHandler = BaseAPIHandler.sharedInstance()
        
        apiHandler.requestForApi(urlString: WebConstants.symptoms.path, method: WebConstants.symptoms.method, parameters:nil, headers: [:], completion:{ (result) in
            switch result {
            case .success(let data):
                guard let jsonData = data else{
                    completion([],"Error")
                    return
                }
                do{
                    let jsonDecoder = JSONDecoder()

                    let symptoms = try jsonDecoder.decode([SymptomModel].self, from: jsonData)
                    completion(symptoms, "")
                }
                catch{
                    completion([],"Error in api")
                }
            case .failure(let error, let _):
                completion([],"Error in api")
            }
        })
    }
    
    func performGetSymptomsResult(ids:[String],completion:@escaping(_ result: [SymptomModel], _ error : String ) -> Void){
        
        let apiHandler = BaseAPIHandler.sharedInstance()
        let param = ["id" : ""]
        apiHandler.requestForApi(urlString:WebConstants.symptomsResult.path, method: WebConstants.symptomsResult.method, parameters:param, headers: [:], completion:{ (result) in
            switch result {
            case .success(let data):
                guard let jsonData = data else{
                    completion([],"Error")
                    return
                }
                do{
                    let jsonDecoder = JSONDecoder()
                    let symptoms = try jsonDecoder.decode([SymptomModel].self, from: jsonData)
                    completion(symptoms, "")
                }
                catch{
                    completion([],"Error in api")
                }
            case .failure(let error, let _):
                completion([],"Error in api")
            }
        })
    }
    
    func performGetDisease(completion:@escaping(_ result: [Disease], _ error : String ) -> Void){
        let apiHandler = BaseAPIHandler.sharedInstance()
        
        let header = ["Authorization" : TokenModel.shareInstance().getToken()]
        apiHandler.requestForApi(urlString: WebConstants.symptoms.path, method: WebConstants.symptoms.method, parameters:nil, headers: header, completion:{ (result) in
            switch result {
            case .success(let data):
                guard let jsonData = data else{
                    completion([],"Error")
                    return
                }
                do{
                    let jsonDecoder = JSONDecoder()

                    let symptoms = try jsonDecoder.decode([Disease].self, from: jsonData)
                    completion(symptoms, "")
                }
                catch{
                    completion([],"Error in api")
                }
            case .failure(let error, let _):
                completion([],"Error in api")
            }
        })
        
    }
    func performGetMedicin(completion:@escaping(_ result: [Medicine], _ error : String ) -> Void){
        let apiHandler = BaseAPIHandler.sharedInstance()
        
        let path = "medicines"
        let header = ["Authorization" : TokenModel.shareInstance().getToken()]
        apiHandler.fireRequest(serverUrl: Config.BACKEND_URL, urlString: path, method: HTTPMethod.get, parameters: nil, headers: header, uRLEncoding: URLEncoding.default, completion:{ (result) in
            switch result {
            case .success(let data):
                guard let jsonData = data else{
                    completion([],"Error")
                    return
                }
                do{
                    let jsonDecoder = JSONDecoder()
                    let symptoms = try jsonDecoder.decode([Medicine].self, from: jsonData)
                    completion(symptoms, "")
                }
                catch{
                    completion([],"Error in api")
                }
            case .failure(let error, let _):
                completion([],"Error in api")
            }
        })
    }
    
    func performGetAlternativeMedicin(id : String,completion:@escaping(_ result: [Medicine], _ error : String ) -> Void){
        let apiHandler = BaseAPIHandler.sharedInstance()
     //   let path = "medicines/brands/\(id)/alternatives"
        let path = "medicinenames?id=\(id)"
        let header = ["Authorization" : TokenModel.shareInstance().getToken(),
                      "Content-Type" : "application/json"]

        let param = ["id" : id]
        apiHandler.fireRequest(serverUrl: Config.BACKEND_URL, urlString: path, method: HTTPMethod.get, parameters: param, headers: header, uRLEncoding: URLEncoding.default, completion:{ (result) in
            switch result {
            case .success(let data):
                guard let jsonData = data else{
                    completion([],"Error")
                    return
                }
                do{
                    let jsonDecoder = JSONDecoder()
                    let symptoms = try jsonDecoder.decode([Medicine].self, from: jsonData)
                    completion(symptoms, "")
                }
                catch{
                    completion([],"Error in api")
                }
            case .failure(let error, let _):
                completion([],"Error in api")
            }
        })
    }
}
