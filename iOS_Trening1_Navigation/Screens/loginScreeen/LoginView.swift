//
//  LoginView.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 30/11/2020.
//

import UIKit

class LoginView: UIView {
    public let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8.0
        return button
    }()
    
    
    public func prepareLayout() {
//        title = nil
        backgroundColor = .white
        addSubview(loginButton)
        
        loginButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        loginButton.center = center
    }
}
