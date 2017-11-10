//
//  UserDefaultsManager.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

fileprivate extension String {
    
    static var accessTokenKey:  String { return "accessToken" }
    static var isAuthorized:    String { return "isAuthorized" }
    static var username:        String { return "username" }
}

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    func authorize(_ isAuthorize: Bool) {
        self.defaults.set(isAuthorize, forKey: .isAuthorized)
        
        if !isAuthorize { setAccessToken(nil) }
    }
    
    func isAuthorized() -> Bool {
        return self.defaults.bool(forKey: .isAuthorized)
    }
    
    func setAccessToken(_ accessToken: String?) {
        self.defaults.set(accessToken, forKey: .accessTokenKey)
    }
    
    var accessToken: String? {
        return self.defaults.object(forKey: .accessTokenKey) as? String
    }
    
    func setUsername(_ username: String?) {
        self.defaults.set(username, forKey: .username)
    }
    
    var username: String? {
        return self.defaults.object(forKey: .username) as? String
    }
}
