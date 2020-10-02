//
//  HomeViewController.swift
//  Pep
//
//  Created by befy on 10/02/2020.
//  Copyright (c) 2020 befy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 230/255, green: 57/255, blue: 70/255, alpha: 1)
    }
    
    static func factory() -> HomeViewController {
        let viewController = HomeViewController()
        viewController.tabBarItem = .makeTabBarItem(title: "Home", image: UIImage(named: "search-unselected"), selectedImage: UIImage(named: "search-selected"))
        return viewController
    }
}

