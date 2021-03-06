//
//  User.swift
//  Meibo
//
//  Created by Zhouboli on 15/8/21.
//  Copyright (c) 2015年 Boris. All rights reserved.
//

import UIKit

class User: NSObject
{
    var
        user_id: Int?,
        idstr: String?,
        screen_name: String?,
        name: String?,
        province: Int?,
        city: Int?,
        location: String?,
        user_description: String?,
        url: String?,
        profile_image_url: String?,
        profile_url: String?,
        domain: String?,
        weihao: String?,
        gender: String?,
        followers_count: Int?,
        friends_count: Int?,
        statuses_count: Int?,
        favourites_count: Int?,
        created_at: String?,
        allow_all_act_msg: Bool?,
        geo_enabled: Bool?,
        verified: Bool?,
        remark: String?,
        allow_all_comment: Bool?,
        avatar_large: String?,
        avatar_hd: String?,
        verified_reason: String?,
        follow_me: Bool?,
        online_status: Int?,
        bi_followers_count: Int?,
        lang: String?
    
    func initWithDictionary(dictionary: NSDictionary) -> User
    {
        self = super.init()
        
        if self != nil
        {
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
        }
        
        return self
    }
    
    func convertNSDictionary() -> NSDictionary
    {
        let dict: NSDictionary = ["id": self.user_id!, "idstr": self.idstr!, "screen_name": self.screen_name!, "name": self.name!, "province": self.province!, "city": self.city!, "location": self.location!, "user_description": self.user_description!, "url": self.url!, "profile_image_url": self.profile_image_url!, "profile_url": self.profile_url!, "domain": self.domain!, "weihao": self.weihao!, "gender": self.gender!, "followers_count": NSNumber(integer: self.followers_count!), "friends_count": NSNumber(integer: self.friends_count!), "statuses_count": NSNumber(integer: self.statuses_count!), "favourites_count": NSNumber(integer: self.favourites_count!), "created_at": self.created_at!, "allow_all_act_msg": NSNumber(bool: self.allow_all_act_msg!), "geo_enabled": NSNumber(bool: self.geo_enabled!), "verified": NSNumber(bool: self.verified!), "remark": self.remark!, "allow_all_comment": NSNumber(bool: self.allow_all_comment!), "avatar_large": self.avatar_large!, "avatar_hd": self.avatar_hd!, "verified_reason": self.verified_reason!, "follow_me": NSNumber(bool: self.follow_me!), "online_status": NSNumber(integer: self.online_status!), "bi_followers_count": NSNumber(integer: self.bi_followers_count!), "lang": self.lang!]
        
        return dict
    }  
}
