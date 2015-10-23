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
    var heightForWaterfall: Float?
    var user: User?
    var retweeted_status: Status?
    var pic_urls: NSMutableArray?
    
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
