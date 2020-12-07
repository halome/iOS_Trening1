//
//  FirstTabViewController.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 30/11/2020.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    lazy var myView: HomeView = {
        let view = HomeView(tabBarHeight: tabBarController?.tabBar.frame.size.height ?? 0.0)
        
        return view;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        prepareNavigationItems()
        
    }
    
    func prepareView() {
        title = "Home"
        view = myView
        myView.delegate = self
    }
    
    func prepareNavigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(backAction))
    }

    @objc func backAction(){
        dismiss(animated: true, completion: nil)
    }
}

extension HomeViewController: HomeViewActionsDelegate {
    func homeViewOnFirstButtonPress(firstButton: UIButton) {
        print("no działa")
    }
}
