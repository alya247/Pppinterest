//
//  User.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var id: String?
    var username: String?
    var firstName: String?
    var lastName: String?
    
    // Mappable
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        username    <- map["username"]
        firstName   <- map["first_name"]
        lastName    <- map["last_name"]
    }
}
