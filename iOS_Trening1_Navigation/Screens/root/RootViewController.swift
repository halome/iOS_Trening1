//
//  ViewController.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 30/11/2020.
//

import UIKit

class RootViewController: UIViewController {
    override func loadView(){
        view = RootView()
        
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get stored token to check if is already logged in
        // e.q with UserService.getToken()
        
        let loginView = LoginViewController()
        loginView.loadViewIfNeeded()
        loginView.modalPresentationStyle = .fullScreen
        
        present(loginView, animated: true)
    }
}

