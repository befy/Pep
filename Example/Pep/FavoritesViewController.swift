//
//  FavoritesViewController.swift
//  Pep_Example
//
//  Created by Alper Tabak on 2.10.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 168/255, green: 218/255, blue: 220/255, alpha: 1)
    }
    
    static func factory() -> FavoritesViewController {
        let viewController = FavoritesViewController()
        viewController.tabBarItem = .makeTabBarItem(title: "Favorites", image: UIImage(named: "favorites-unselected"), selectedImage: UIImage(named: "favorites-selected"))
        return viewController
    }
    
}
