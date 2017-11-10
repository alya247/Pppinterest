//
//  UserAPI.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class UserAPI {
    
    enum Route {
        case me
        case boards
        case pins
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            switch self {
            case .me: return API.apiURL + "/v1/me/"
            case .boards: return API.apiURL + "/v1/me/boards/"
            case .pins: return API.apiURL + "/v1/me/pins/"
            }
        }
        
        var parameters: [String: Any]? {
            
            switch self {
            case .pins:
                let params = ["access_token":  UserDefaultsManager.shared.accessToken ?? "",
                              "fields":        "note,image"]
                return params
            case .me:
                let params = ["access_token":  UserDefaultsManager.shared.accessToken ?? "",
                              "fields":        "username,first_name,last_name"]
                return params
            case .boards:
                let params = ["access_token":  UserDefaultsManager.shared.accessToken ?? "",
                              "fields":         "name"]
                return params
            }
        }
    }
    
    static func getMe(closure: @escaping (_ handler: User?) -> Void)   {
        
        let request = Route.me
        
        Alamofire.request(request.path, method: request.method, parameters: request.parameters).responseJSON { response in
            
            switch response.result {
            case .success(let json):
                let me = Mapper<User>().map(JSONObject: (json as AnyObject).value(forKey: "data"))
                
                if UserDefaultsManager.shared.username == nil && me?.username != nil {
                    UserDefaultsManager.shared.setUsername(me?.username)
                }
                
                closure(me)
            case .failure:
                closure(nil)
            }
        }
    }
    
    static func getMyBoards(closure: @escaping (_ handler: [Board]) -> Void)   {
        
        let request = Route.boards
        
        Alamofire.request(request.path, method: request.method, parameters: request.parameters).responseJSON { response in
            
            switch response.result {
            case .success(let json):
                let boards = Mapper<Board>().mapArray(JSONObject: (json as AnyObject).value(forKey: "data"))
                closure(boards ?? [])
            case .failure:
                closure([])
            }
        }
    }
    
    static func getMyPins(closure: @escaping (_ handler: [Pin]) -> Void)   {
        
        let request = Route.pins
        
        Alamofire.request(request.path, method: request.method, parameters: request.parameters).responseJSON { response in
            
            switch response.result {
            case .success(let json):
                let pins = Mapper<Pin>().mapArray(JSONObject: (json as AnyObject).value(forKey: "data"))
                closure(pins ?? [])
            case .failure:
                closure([])
            }
        }
    }
}
