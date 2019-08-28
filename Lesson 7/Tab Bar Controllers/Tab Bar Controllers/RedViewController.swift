//
//  ViewController.swift
//  Tab Bar Controllers
//
//  Created by Dipesh Trikam on 27/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class RedViewController: UIViewController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.delegate = self

        // Do any additional setup after loading the view.
        tabBarItem.badgeValue = "!"
    }


    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 1 {
            tabBarItem.badgeValue = nil
        }
    }


}

