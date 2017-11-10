//
//  EnterViewController.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var logInButton: UIButton!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logInButton.decorator.apply(Style.roundCorners(logInButton.frame.height / 2))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Actions
    
    @IBAction func logIn(_ sender: UIButton) {
        
        let authVC = R.storyboard.login.authVC()!
        navigationController?.pushViewController(authVC, animated: true)
    }
}
