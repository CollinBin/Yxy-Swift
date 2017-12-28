//
//  YXYTarBarController.swift
//  Yxy-Swift
//
//  Created by songbincheng on 28/12/2017.
//  Copyright © 2017 宋滨诚. All rights reserved.
//

import UIKit

class YXYTarBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        createTabBarChildViewController()
    }
    
    func createTabBarChildViewController() {
        let homeNavc = addChildViewController(childViewController: YXYHomeViewController(), title: "首页", normalImageName: "Tab-Home", selectedImageName: "Tab-Home-Selected")
        let discoverNavc = addChildViewController(childViewController: YXYDiscoverViewController(), title: "发现", normalImageName: "Tab-Discover", selectedImageName: "Tab-Discover-Selected")
        let recordNavc = addChildViewController(childViewController: YXYRecordViewController(), title: "记录", normalImageName: "Tab-Record", selectedImageName: "Tab-Record-Selected")
        let consultNavc = addChildViewController(childViewController: YXYConsultViewController(), title: "咨询", normalImageName: "Tab-Consult", selectedImageName: "Tab-Consult-Selected")
        let meNavc = addChildViewController(childViewController: YXYMeViewController(), title: "我的", normalImageName: "Tab-Me", selectedImageName: "Tab-Me-Selected")
        viewControllers = [homeNavc, discoverNavc, recordNavc, consultNavc, meNavc]
        tabBar.tintColor = UIColor.orange
        tabBar.barTintColor = UIColor.lightText
        self.tabBar.shadowImage = nil
        tabBar.isTranslucent = false
    }
    
    func addChildViewController(childViewController: UIViewController, title: String, normalImageName: String, selectedImageName: String) -> YXYNavigationController {
        let tabBarItem = UITabBarItem(title: title, image: UIImage (named: normalImageName), selectedImage: UIImage (named: selectedImageName))
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        childViewController.tabBarItem = tabBarItem
        return YXYNavigationController(rootViewController: childViewController)
    }

    private func tabBarController(tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    private func tabBarController(tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
