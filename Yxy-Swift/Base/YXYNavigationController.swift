//
//  YXYNavigationController.swift
//  Yxy-Swift
//
//  Created by songbincheng on 28/12/2017.
//  Copyright © 2017 宋滨诚. All rights reserved.
//

import UIKit

class YXYNavigationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        configStatusBar()
        configNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configStatusBar() {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent;
    }
    
    private func configNavigationBar() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = YXYThemeColor
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                             NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.0)]
    }
    
}
