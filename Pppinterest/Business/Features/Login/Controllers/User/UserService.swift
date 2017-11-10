//
//  UserService.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

class UserService {
    
    func getMe(clousure callback: @escaping (User?) -> Void) {
        
        UserAPI.getMe() { user in
            callback(user)
        }
    }
}
