//
//  AppNavigator.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class AppNavigator {
    
    func setupRootViewController(in window: UIWindow?) {
                
        if UserDefaultsManager.shared.isAuthorized() {
            window?.rootViewController = R.storyboard.login.userNC()
            
        } else {
            window?.rootViewController = R.storyboard.login.instantiateInitialViewController()
        }
                
        window?.makeKeyAndVisible()
    }
}
