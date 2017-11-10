//
//  UserPresenter.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUser(_ user: User)
    func setEmptyData()
}

class UserPresenter {
    
    fileprivate let userService: UserService
    weak fileprivate var userView: UserView?
    
    init(userService: UserService = UserService()) {
        self.userService = userService
    }
    
    func attachView(_ view: UserView) {
        userView = view
    }
    
    func getUser() {
        userView?.startLoading()
        userService.getMe() { [weak self] user in
            self?.userView?.finishLoading()
            if user != nil {
                self?.userView?.setUser(user!)
            } else {
                self?.userView?.setEmptyData()
            }
        }
    }
}
