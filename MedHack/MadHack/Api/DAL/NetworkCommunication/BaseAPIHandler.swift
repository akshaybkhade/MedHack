import Foundation
import Alamofire

enum BaseAPIResult<T>{
    case success(result: T)
    case failure(error:APIErrors,data: Data?)
}

enum APIErrors : Error{
    case badRequest
    case forbiddenAccess
    case pageNotfound
    case invalidData
    case unauthorized
    case unknown
    case internalServerError
    case NoInternetConnection
    
    static  func getErrorCode(error : APIErrors) -> String{
        
        switch(error){
        case APIErrors.NoInternetConnection:
            return "0"
        case APIErrors.unauthorized:
            return "401"
        case APIErrors.forbiddenAccess:
            return "403"
        case APIErrors.pageNotfound:
            return "404"
        case APIErrors.internalServerError:
            return "500"
        default:
            return "0"
        }
    }
}

typealias ApiRequestCompletionHandler = (_ result: BaseAPIResult<Data?>) -> Void


public class BaseAPIHandler : NSObject {
    var runningOperations : Int = 0
    private static var mSharedInstance : BaseAPIHandler?  = nil;
    private var baseUrl : String?
    private override init() {}
    
    public class func sharedInstance()->BaseAPIHandler {
        if(mSharedInstance == nil){
            mSharedInstance = BaseAPIHandler()
            let baseUrl = Config.BASE_URL
            mSharedInstance?.baseUrl = "\(baseUrl)"
        }
        return mSharedInstance!
    }
    
    public func getBaseUrl() ->String? {
        return baseUrl
    }
    
    public func getRunningOperationCount()->Int{
        return runningOperations
    }
    
    func requestForApi(baseURL : String, urlString:String,method:HTTPMethod,
                        parameters: [String: String]?,headers :HTTPHeaders, completion:@escaping ApiRequestCompletionHandler)
    {
        addToRunningOperations()
      
          self.fireRequest(urlString: baseURL, method: method, parameters: parameters, headers: headers, uRLEncoding: URLEncoding.default, completion: completion)
    }
    
    func requestForApi (urlString:String,method:HTTPMethod,
                        parameters: [String: String]?,headers :HTTPHeaders, completion:@escaping ApiRequestCompletionHandler)
    {
        addToRunningOperations()

        self.fireRequest(urlString: urlString, method: method, parameters: parameters, headers: headers, uRLEncoding: URLEncoding.default, completion: completion)
    }

    func requestForDeleteApi (urlString:String,method:HTTPMethod,
                        parameters: [String: String]?,headers :HTTPHeaders, completion:@escaping ApiRequestCompletionHandler)
    {
        addToRunningOperations()
        self.fireRequest(urlString: urlString, method: method, parameters: parameters, headers: headers, uRLEncoding: URLEncoding.httpBody, completion: completion)
    }
    
    private func fireRequest(urlString:String,method:HTTPMethod,
                      parameters: [String: String]?,headers :HTTPHeaders,uRLEncoding : URLEncoding, completion:@escaping ApiRequestCompletionHandler){
        
        let url = "\(baseUrl!)\(urlString)"
        debugPrint("API :- \( url)")
        debugPrint("Parameter :- \(String(describing:  parameters))")

        let request = Alamofire.request(url, method: method, parameters: parameters, encoding: uRLEncoding,headers:headers)
        
        request.responseString { (response) in

            var statusCode = response.response?.statusCode ?? 400
            if(response.response?.statusCode == nil && response.result.error?.localizedDescription != nil){
                if((response.result.error?.localizedDescription)!.contains("The Internet connection appears to be offline")){
                    statusCode = 0
                }
            }
            APIErrorHandler.checkForError(statusCode: statusCode, data: response.data)
            //statusCode
            switch(statusCode){
            case 0:
                completion(.failure(error: APIErrors.NoInternetConnection,data: response.data))
            case 200:
                completion(.success(result: response.data));
            case 401:
                completion(.failure(error: APIErrors.unauthorized,data: response.data))
            case 400:
                completion(.failure(error: APIErrors.invalidData,data: response.data))
            case 404:
                completion(.failure(error: APIErrors.pageNotfound,data: response.data))
            case 403:
                completion(.failure(error: APIErrors.forbiddenAccess,data: response.data))
            case 500:
                completion(.failure(error: APIErrors.internalServerError,data: response.data))
            default:
                completion(.failure(error: APIErrors.unknown,data: response.data))
            }
        }
        
    }
    
     func fireRequest(serverUrl : String,urlString:String,method:HTTPMethod,
                             parameters: [String: String]?,headers :HTTPHeaders,uRLEncoding : URLEncoding, completion:@escaping ApiRequestCompletionHandler){
        
        let url = "\(serverUrl)\(urlString)"
        debugPrint("API :- \( url)")
        debugPrint("Parameter :- \(String(describing:  parameters))")
        
        let request = Alamofire.request(url, method: method, parameters: parameters, encoding: uRLEncoding,headers:headers)
        
        request.responseString { (response) in
            
            var statusCode = response.response?.statusCode ?? 400
            if(response.response?.statusCode == nil && response.result.error?.localizedDescription != nil){
                if((response.result.error?.localizedDescription)!.contains("The Internet connection appears to be offline")){
                    statusCode = 0
                }
            }
            APIErrorHandler.checkForError(statusCode: statusCode, data: response.data)
            //statusCode
            switch(statusCode){
            case 0:
                completion(.failure(error: APIErrors.NoInternetConnection,data: response.data))
            case 200:
                completion(.success(result: response.data));
            case 401:
                completion(.failure(error: APIErrors.unauthorized,data: response.data))
            case 400:
                completion(.failure(error: APIErrors.invalidData,data: response.data))
            case 404:
                completion(.failure(error: APIErrors.pageNotfound,data: response.data))
            case 403:
                completion(.failure(error: APIErrors.forbiddenAccess,data: response.data))
            case 500:
                completion(.failure(error: APIErrors.internalServerError,data: response.data))
            default:
                completion(.failure(error: APIErrors.unknown,data: response.data))
            }
        }
        
    }
    
    private func addToRunningOperations() {
        
        runningOperations += 1;
    }
    
    private func removeFromRunningOperations() {
        
        runningOperations -= 1;
    }
}

