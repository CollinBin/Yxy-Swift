//
//  UIScreen+Frame.swift
//  Yxy-Swift
//
//  Created by songbincheng on 29/12/2017.
//  Copyright © 2017 宋滨诚. All rights reserved.
//

import UIKit

extension UIScreen {
    
    public var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    public var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    public var navigationBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    public var tabBarHeight: CGFloat {
        return AppDelegate().mTabBarController!.tabBar.bounds.size.height
    }
    
}
