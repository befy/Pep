//
//  TabBarController.swift
//  Pep_Example
//
//  Created by Alper Tabak on 2.10.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import Pep

final class TabBarController: PepBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTabBar()
        
        self.viewControllers = [
            HomeViewController.factory(),
            FavoritesViewController.factory(),
            SettingsViewController.factory()
        ]
    }
    
    private func customizeTabBar() {
        self.backgroundColor = .white
        self.indicatorColor = UIColor(red: 245/255, green: 147/255, blue: 76/255, alpha: 1)
    }
    
}
