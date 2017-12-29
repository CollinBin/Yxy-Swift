//
//  YXYTabBarController.swift
//  Yxy-Swift
//
//  Created by songbincheng on 29/12/2017.
//  Copyright © 2017 宋滨诚. All rights reserved.
//

import UIKit

class YXYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarChildViewController()
    }
    
    func createTabBarChildViewController() {
        let homeNavc = addChildViewController(childViewController: YXYHomeViewController(), title: "首页", normalImageName: "Tab-Home", selectedImageName: "Tab-Home-Selected")
        let discoverNavc = addChildViewController(childViewController: YXYDiscoverViewController(), title: "发现", normalImageName: "Tab-Discover", selectedImageName: "Tab-Discover-Selected")
        let recordNavc = addChildViewController(childViewController: YXYRecordViewController(), title: "记录", normalImageName: "Tab-Record", selectedImageName: "Tab-Record-Selected")
        let consultNavc = addChildViewController(childViewController: YXYConsultViewController(), title: "咨询", normalImageName: "Tab-Consult", selectedImageName: "Tab-Consult-Selected")
        let meNavc = addChildViewController(childViewController: YXYMeViewController(), title: "我的", normalImageName: "Tab-Me", selectedImageName: "Tab-Me-Selected")
        self.viewControllers = [homeNavc, discoverNavc, recordNavc, consultNavc, meNavc]
        self.tabBar.tintColor = YXYThemeColor
    }
    
    func addChildViewController(childViewController: UIViewController, title: String, normalImageName: String, selectedImageName: String) -> YXYNavigationController {
        let tabBarItem = UITabBarItem(title: title, image: UIImage (named: normalImageName), selectedImage: UIImage (named: selectedImageName))
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        childViewController.tabBarItem = tabBarItem
        return YXYNavigationController(rootViewController: childViewController)
    }
    
}
