//
//  AccessTokenModel.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import ObjectMapper

class AuthModel: Mappable {
    
    var accessToken: String?
    var scope: String?
    var tokenType: String?
    
    // Mappable
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        accessToken     <- map["access_token"]
        scope           <- map["scope"]
        tokenType       <- map["token_type"]
    }
}
