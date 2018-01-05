//
//  YXYHttpRequestManager.swift
//  Yxy-Swift
//
//  Created by songbincheng on 04/01/2018.
//  Copyright © 2018 宋滨诚. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import TAKUUID
import AdSupport

enum MethodType {
    case get
    case post
}

class YXYHttpRequestManager: NSObject {
    
    class func requestData(_ URLString: String!, _ type : MethodType ,params: [String: Any]? = nil,success:@escaping (SwiftyJSON.JSON) -> (), failure:((DataResponse<Any>) -> ())? = nil){
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        let headers: HTTPHeaders = [
            "Accept" : "application/json",
            "hgestation" : "-1",
            "deviceno" : "",//TAKUUIDStorage.sharedInstance().findOrCreate()!,
            "ostype" : "1",
            "osversion" : UIDevice.current.systemVersion,
            "birthday" : "",
            "expectedDate" : "",
            "userico" : "",
            "usernick" : "",
            "channel" : "official",
            "appcode" : "20000",
            "clientversion" : Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String,
            "yxyskin" : "0",
            "prematureOpen" : "0",
            "idfa" : ASIdentifierManager.shared().advertisingIdentifier.uuidString,
            "sign" : "0",
        ]
        
        Alamofire.request(URLString!, method: method, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            
            if response.result.isSuccess {
                let json = JSON(response.data!)
                success(json)
                
            } else {
                if let fail = failure {
                    // 可这里进行统一处理 400 404 等
                    fail(response)
                }
            }
        }
    }
    
}
