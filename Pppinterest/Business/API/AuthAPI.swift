//
//  AuthAPI.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class AuthAPI {
    
    enum Route {
        case authCode
        case accessToken(code: String)
        
        var method: HTTPMethod {
            switch self {
            case .authCode: return .post
            case .accessToken: return .post
            }
        }
        
        var path: String {
            switch self {
            case .authCode:
                return API.apiURL + "/oauth/" + "?response_type=code&client_id=\(API.appID)&state=success&scope=read_public,write_public&redirect_uri=\(API.redirectURI)"
            case .accessToken:
                return API.apiURL + "/v1/oauth/token"
            }
        }
        
        var parameters: [String: Any]? {
            
            switch self {
            case .authCode: return nil
            case .accessToken(let code):
                let params = ["grant_type":     "authorization_code",
                              "client_id":      API.appID,
                              "client_secret":  API.appSecret,
                              "code":           code]
                return params
            }
        }
    }
        
    static func codeRequest() -> URL? {
        return URL(string: Route.authCode.path)
    }
    
    static func accessTokenRequest(code: String, closure: @escaping (_ handler: AuthModel?) -> Void)   {
        
        let request = Route.accessToken(code: code)
        
        Alamofire.request(request.path, method: request.method, parameters: request.parameters).responseJSON { response in
            
            switch response.result {
            case .success(let json):
                let auth = Mapper<AuthModel>().map(JSONObject: json)
                closure(auth)
            case .failure:
                closure(nil)
            }
        }
    }
}

