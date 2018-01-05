//
//  YXYHomeViewController.swift
//  Yxy-Swift
//
//  Created by songbincheng on 05/01/2018.
//  Copyright © 2018 宋滨诚. All rights reserved.
//

import UIKit
import SnapKit
import MJRefresh

class YXYHomeViewController: YXYViewController, UITableViewDelegate, UITableViewDataSource {
    
    let mCellIdentifier = "HomeTableViewCellID"
    var mHomeTableView = UITableView()
    var mCellTitleData = ["Please Login", "YXYKnowledgeDetail", "YXYCoupDetail"]
    
    let header = MJRefreshGifHeader()
    let footer = MJRefreshAutoNormalFooter()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "首页"
        
        mHomeTableView.delegate = self
        mHomeTableView.dataSource = self
        mHomeTableView.backgroundColor = UIColor.clear
        mHomeTableView.separatorStyle = .none
        mHomeTableView.allowsMultipleSelection = false
        mHomeTableView.estimatedRowHeight = 0.0
        mHomeTableView.estimatedSectionHeaderHeight = 0.0
        mHomeTableView.estimatedSectionFooterHeight = 0.0
        mHomeTableView.register(UITableViewCell.self, forCellReuseIdentifier: mCellIdentifier)
        view.addSubview(mHomeTableView)
        mHomeTableView.snp.makeConstraints { (make) -> Void in
            make.center.size.equalTo(view)
        }
        
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        mHomeTableView.mj_header = header
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        mHomeTableView.mj_footer = footer
    }
    
    @objc func headerRefresh() {
        mHomeTableView.mj_header.endRefreshing()
    }
    
    @objc func footerRefresh() {
        mHomeTableView.mj_footer.endRefreshing()
    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mCellTitleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mCellIdentifier)
        cell?.selectionStyle = .none
        cell?.textLabel?.text = mCellTitleData[indexPath.row]
        return cell!
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 80.0;
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let welcomeVC = YXYWelcomeViewController()
        welcomeVC.hidesBottomBarWhenPushed = true
//        let naviWelcome = YXYNavigationController(rootViewController: welcomeVC)
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    @objc func buttonAction() {
        let url = "http://192.168.0.11/v55/user/sendVerificationCode"
        let params = ["mobile": "18500779794",
                      "dialCode": "86"]
        
        YXYApiManager.requestHomeTitleList(url, params: params , success: { (result) in
            print(result)
        }) { (err) in
            print(err)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

