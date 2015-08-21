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
    var allow_all_act_msg = false
    var geo_enabled = false
    var verified = false
    var remark: String?
    var allow_all_comment = false
    var avatar_large: String?
    var avatar_hd: String?
    var verified_reason: String?
    var follow_me = false
    var online_status: Int?
    var bi_followers_count: Int?
    var lang: String?
}
