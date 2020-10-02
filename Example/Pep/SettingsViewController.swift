//
//  SettingsViewController.swift
//  Pep_Example
//
//  Created by Alper Tabak on 2.10.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 27/255, green: 48/255, blue: 62/255, alpha: 1)
    }
    
    static func factory() -> SettingsViewController {
        let viewController = SettingsViewController()
        viewController.tabBarItem = .makeTabBarItem(title: "Settings", image: UIImage(named: "settings-unselected"), selectedImage: UIImage(named: "settings-selected"))
        return viewController
    }
    
    
}
