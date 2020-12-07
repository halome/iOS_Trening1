//
//  MainViewController.swift
//  Tutorial3_Navigation
//
//  Created by rafał.łowczy on 30/11/2020.
//

import UIKit

struct TabBarItem {
    var title: String
    var view: UIViewController
    var iconSystemName: String
    
    init(title: String, view: UIViewController, iconSystemName: String) {
        self.title = title
        self.view = view
        self.iconSystemName = iconSystemName
    }
}

class TabBarProvider {
    var items: [TabBarItem]
    
    init(items: [TabBarItem]){
        self.items = items
    }
    
    public func provide() -> [UIViewController] {
        let tabBarSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 10, weight: .black)
        
        return items.enumerated().map { (index, tabBarElement) -> UIViewController in
            let tabView: UIViewController = UINavigationController(rootViewController: tabBarElement.view)
            let icon = UIImage(systemName: tabBarElement.iconSystemName, withConfiguration: tabBarSymbolConfiguration)
            
            tabView.tabBarItem = UITabBarItem(title: tabBarElement.title, image: icon ?? nil, tag: index)
            
            return tabView
        }
    }
}

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTabs()
    }
    
    private func prepareTabs() {
        let tabBarItems: [TabBarItem] = [
            TabBarItem(title: "home", view: HomeViewController(), iconSystemName: "house"),
            TabBarItem(title: "list", view: ListViewController(), iconSystemName: "bell")
        ]
        
        viewControllers = TabBarProvider(items: tabBarItems).provide()
    }
}
