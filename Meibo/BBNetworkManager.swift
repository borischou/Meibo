//
//  BBNetworkManager.swift
//  Meibo
//
//  Created by Zhouboli on 15/10/26.
//  Copyright © 2015年 Boris. All rights reserved.
//

import Foundation
import UIKit
import Accounts
import Social
import Alamofire

class BBNetworkManager: NSObject {
    
    
    
    static func weiboRequest(weiboAccount: ACAccount, url: NSString, method: SLRequestMethod, params: NSDictionary)
    {
        let request = SLRequest(forServiceType: SLServiceTypeSinaWeibo, requestMethod: method, URL: NSURL(string: "https://api.weibo.com/2/\(url)" as String), parameters: params as [NSObject : AnyObject])
        request.account = weiboAccount
        let urlrequest = request.preparedURLRequest()
        
    }
}