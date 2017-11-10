//
//  PinsService.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

class PinsService {
    
    func getPins(withBoardName boardName: String, clousure callback: @escaping ([Pin]) -> Void) {
        
        BoardAPI.getPins(withBoardName: boardName) { pins in
            callback(pins)
        }
    }
}
