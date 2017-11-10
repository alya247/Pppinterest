//
//  BoardAPI.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class BoardAPI {
    
    enum Route {
        case pins(boardName: String)
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            switch self {
            case .pins(let boardName):
                let username = UserDefaultsManager.shared.username ?? ""
                return API.apiURL + "/v1/boards/\(username)/\(boardName)/pins/"
            }
        }
        
        var parameters: [String: Any]? {
            
            switch self {
            case .pins:
                let params = ["access_token":  UserDefaultsManager.shared.accessToken ?? "",
                              "fields":        "note,image"] 
                return params
            }
        }
    }
    
    static func getPins(withBoardName boardName: String, closure: @escaping (_ handler: [Pin]) -> Void)   {
        
        let request = Route.pins(boardName: boardName)
        
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

