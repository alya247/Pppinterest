//
//  BaseViewController.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupShadow()
        NVActivityIndicatorView.DEFAULT_TYPE = .ballRotateChase
    }
}

// Navigation Customization

extension BaseViewController {
    
    func setupShadow() {
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.08).cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        navigationController?.navigationBar.layer.shadowRadius = 2.0
        navigationController?.navigationBar.layer.shadowOpacity = 1.0
        navigationController?.navigationBar.layer.masksToBounds = false
    }
}
