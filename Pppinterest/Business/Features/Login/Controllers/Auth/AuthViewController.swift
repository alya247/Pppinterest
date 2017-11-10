//
//  AuthViewController.swift
//  Pppinterest
//
//  Created by Alya Filon on 09.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var loginWebView: UIWebView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let codeRequest = AuthAPI.codeRequest() else { return }
        
        let request = URLRequest(url: codeRequest, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        loginWebView.loadRequest(request)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - UIWebViewDelegate

extension AuthViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool  {
        
        guard let request = request.url?.absoluteString else { return false }

        var redirectString: [String] = request.components(separatedBy: API.redirectURI)

        var code = [String]()
        if redirectString.count > 1 {
            code = redirectString[1].components(separatedBy: "&code=")
        }

        if code.count > 1 {

            AuthAPI.accessTokenRequest(code: code[1]) { [weak self] auth in

                if let auth = auth,
                    let accessToken = auth.accessToken {
                    UserDefaultsManager.shared.authorize(true)
                    UserDefaultsManager.shared.setAccessToken(accessToken)
                    
                    self?.present(R.storyboard.login.userNC()!, animated: true, completion: nil)
                }
            }
            return false
        }
        return true
    }
}
