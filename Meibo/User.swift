//
//  User.swift
//  Meibo
//
//  Created by Zhouboli on 15/8/21.
//  Copyright (c) 2015年 Boris. All rights reserved.
//

import UIKit

class User: NSObject {
    var user_id: Int?
    var idstr: String?
    var screen_name: String?
    var name: String?
    var province: Int?
    var city: Int?
    var location: String?
    var user_description: String?
    var url: String?
    var profile_image_url: String?
    var profile_url: String?
    var domain: String?
    var weihao: String?
    var gender: String?
    var followers_count: Int?
    var friends_count: Int?
    var statuses_count: Int?
    var favourites_count: Int?
    var created_at: String?
    var allow_all_act_msg: Bool?
    var geo_enabled: Bool?
    var verified: Bool?
    var remark: String?
    var allow_all_comment: Bool?
    var avatar_large: String?
    var avatar_hd: String?
    var verified_reason: String?
    var follow_me: Bool?
    var online_status: Int?
    var bi_followers_count: Int?
    var lang: String?
    
    func initWithDictionary(dictionary: NSDictionary) -> User {
        self.user_id = Int((dictionary.objectForKey("id") as? String)!)
        self.idstr = dictionary.objectForKey("idstr") as? String
        self.screen_name = dictionary.objectForKey("screen_name") as? String
        self.name = dictionary.objectForKey("name") as? String
        self.province = Int((dictionary.objectForKey("province") as? String)!)
        self.city = Int((dictionary.objectForKey("city") as? String)!)
        self.location = dictionary.objectForKey("location") as? String
        self.user_description = dictionary.objectForKey("user_description") as? String
        self.url = dictionary.objectForKey("url") as? String
        self.profile_image_url = dictionary.objectForKey("profile_image_url") as? String
        self.profile_url = dictionary.objectForKey("profile_url") as? String
        self.domain = dictionary.objectForKey("domain") as? String
        self.weihao = dictionary.objectForKey("weihao") as? String
        self.gender = dictionary.objectForKey("gender") as? String
        self.followers_count = Int((dictionary.objectForKey("followers_count") as? String)!)
        self.friends_count = Int((dictionary.objectForKey("friends_count") as? String)!)
        self.statuses_count = Int((dictionary.objectForKey("statuses_count") as? String)!)
        self.favourites_count = Int((dictionary.objectForKey("favourites_count") as? String)!)
        self.created_at = dictionary.objectForKey("created_at") as? String
        self.allow_all_act_msg = (dictionary.objectForKey("allow_all_act_msg")?.boolValue)!
        self.geo_enabled = (dictionary.objectForKey("geo_enabled")?.boolValue)!
        self.verified = (dictionary.objectForKey("verified")?.boolValue)!
        self.remark = dictionary.objectForKey("remark") as? String
        self.allow_all_comment = (dictionary.objectForKey("allow_all_comment")?.boolValue)!
        self.avatar_large = dictionary.objectForKey("avatar_large") as? String
        self.avatar_hd = dictionary.objectForKey("avatar_hd") as? String
        self.verified_reason = dictionary.objectForKey("verified_reason") as? String
        self.follow_me = (dictionary.objectForKey("follow_me")?.boolValue)!
        self.online_status = Int((dictionary.objectForKey("online_status") as? String)!)
        self.bi_followers_count = Int((dictionary.objectForKey("bi_followers_count") as? String)!)
        self.lang = dictionary.objectForKey("lang") as? String
        
        return self
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
