//
//  Status.swift
//  Meibo
//
//  Created by Zhouboli on 15/8/21.
//  Copyright (c) 2015年 Boris. All rights reserved.
//

import UIKit

class Status: NSObject {
    
    var
        created_at: String?,
        status_id: Int?,
        status_mid: Int?,
        idstr: String?,
        text: String?,
        source: String?,
        favorited = false,
        truncated = false,
        thumbnail_pic: String?,
        bmiddle_pic: String?,
        original_pic: String?,
        reposts_count: Int?,
        comments_count: Int?,
        attitudes_count: Int?,
        height: Float?,
        heightForWaterfall: Float?,
        user: User?,
        retweeted_status: Status?,
        pic_urls: NSMutableArray?
    
    func initWithDictionary(dictionary: NSDictionary) -> Status
    {
        if (dictionary.objectForKey("created_at") != nil)
        {
            self.created_at = dictionary.objectForKey("created_at") as? String
        }
        if (dictionary.objectForKey("id") != nil)
        {
            self.status_id = Int(dictionary.objectForKey("id")! as! String)
        }
        if (dictionary.objectForKey("mid") != nil)
        {
            self.status_mid = Int(dictionary.objectForKey("mid")! as! String)
        }
        if (dictionary.objectForKey("idstr") != nil)
        {
            self.idstr = dictionary.objectForKey("idstr") as? String
        }
        if (dictionary.objectForKey("text") != nil)
        {
            self.text = dictionary.objectForKey("text") as? String
        }
        if (dictionary.objectForKey("source") != nil)
        {
            self.source = dictionary.objectForKey("source") as? String
        }
        if (dictionary.objectForKey("favorited") != nil)
        {
            self.favorited = (dictionary.objectForKey("favorited") as? Bool)!
        }
        if (dictionary.objectForKey("truncated") != nil)
        {
            self.truncated = (dictionary.objectForKey("truncated") as? Bool)!
        }
        if (dictionary.objectForKey("thumbnail_pic") != nil)
        {
            self.thumbnail_pic = dictionary.objectForKey("thumbnail_pic") as? String
        }
        if (dictionary.objectForKey("bmiddle_pic") != nil)
        {
            self.bmiddle_pic = dictionary.objectForKey("bmiddle_pic") as? String
        }
        if (dictionary.objectForKey("original_pic") != nil)
        {
            self.original_pic = dictionary.objectForKey("original_pic") as? String
        }
        if (dictionary.objectForKey("reposts_count") != nil)
        {
            self.reposts_count = Int(dictionary.objectForKey("reposts_count")! as! String)
        }
        if (dictionary.objectForKey("comments_count") != nil)
        {
            self.comments_count = Int(dictionary.objectForKey("comments_count")! as! String)
        }
        if (dictionary.objectForKey("attitudes_count") != nil)
        {
            self.attitudes_count = Int(dictionary.objectForKey("attitudes_count")! as! String)
        }
        if (dictionary.objectForKey("pic_urls") != nil)
        {
            let urls: NSArray = (dictionary.objectForKey("pic_urls") as? NSArray)!
            self.pic_urls = NSMutableArray(capacity: 9)
            for dict in urls
            {
                self.pic_urls?.addObject(dict.objectForKey("thumbnail_pic")!)
            }
        }
        if dictionary.objectForKey("user") != nil
        {
            let dict = dictionary.objectForKey("user") as? NSDictionary
            self.user = User().initWithDictionary(dict!)
        }
        if dictionary.objectForKey("retweeted_status") != nil
        {
            self.retweeted_status = Status().initWithDictionary((dictionary.objectForKey("retweeted_status") as? NSDictionary)!)
        }
        
        return self
    }
}
