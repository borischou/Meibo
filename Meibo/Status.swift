//
//  Status.swift
//  Meibo
//
//  Created by Zhouboli on 15/8/21.
//  Copyright (c) 2015年 Boris. All rights reserved.
//

import UIKit

class Status: NSObject {
    var created_at: String?
    var status_id: Int?
    var status_mid: Int?
    var idstr: String?
    var text: String?
    var source: String?
    var favorited = false
    var truncated = false
    var thumbnail_pic: String?
    var bmiddle_pic: String?
    var original_pic: String?
    var reposts_count: Int?
    var comments_count: Int?
    var attitudes_count: Int?
    var height: Float?
}
