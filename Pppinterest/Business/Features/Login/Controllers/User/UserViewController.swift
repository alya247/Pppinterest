//
//  UserViewController.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class UserViewController: BaseViewController, NVActivityIndicatorViewable {
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var myBoardsView: UIView!
    
    //MARK: - Properties
    
    fileprivate let userPresenter = UserPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        myBoardsView.decorator.apply(Style.roundCorners(5))
        
        userPresenter.attachView(self)
        userPresenter.getUser()
    }
    
    @IBAction func showContent(_ sender: UIButton) {
        
        let contentVC = R.storyboard.content.contentTVC()!
        navigationController?.pushViewController(contentVC, animated: true)
    }
}

//MARK: - UserView

extension UserViewController: UserView {
    
    func startLoading() {
        startAnimating()
    }
    
    func finishLoading() {
        stopAnimating()
    }
    
    func setEmptyData() {
        print("Empty user data")
    }
    
    func setUser(_ user: User) {
        
        title = user.username
        firstNameLabel.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
    }
}
