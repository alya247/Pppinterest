//
//  File.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import ObjectMapper

class Image: Mappable {
    
    var height: Int?
    var url: String?
    var width: Int?
    
    // Mappable
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        height  <- map["height"]
        url     <- map["url"]
        width   <- map["width"]
    }
}
