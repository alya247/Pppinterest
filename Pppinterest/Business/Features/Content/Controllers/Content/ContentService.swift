//
//  ContentService.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

class ContentService {
    
    func getBoards(clousure callback: @escaping ([Board]) -> Void) {
        
        UserAPI.getMyBoards() { boards in
            callback(boards)
        }
    }
    
    func getPins(clousure callback: @escaping ([Pin]) -> Void) {
        
        UserAPI.getMyPins() { pins in
            callback(pins)
        }
    }
}
