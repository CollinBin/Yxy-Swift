//
//  YXYApiManager.swift
//  Yxy-Swift
//
//  Created by songbincheng on 04/01/2018.
//  Copyright © 2018 宋滨诚. All rights reserved.
//

import UIKit
import SwiftyJSON

class YXYApiManager: NSObject {

    class func requestHomeTitleList(_ URLString: String!, params: [String: Any]? = nil,success:@escaping (SwiftyJSON.JSON) -> (), failure:((_ err : Any) -> ())? = nil){
        
        YXYHttpRequestManager.requestData(URLString, .post, params: params, success: { (result) in
            success(result)
        }) { (err) in
            failure!(err)
        }
        
    }
    
}
