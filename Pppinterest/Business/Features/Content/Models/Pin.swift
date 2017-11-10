//
//  Pin.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import ObjectMapper

class Pin: Mappable {
    
    var id: String?
    var image: Image?
    var note: String?
    
    // Mappable
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id      <- map["id"]
        image   <- map["image.original"]
        note    <- map["note"]
    }
}
