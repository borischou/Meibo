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
        if dictionary.objectForKey("created_at")
        {
            self.created_at = dictionary.objectForKey("created_at") as? String
        }
        if dictionary.objectForKey("id")
        {
            self.status_id = Int(dictionary.objectForKey("id")! as! String)
        }
        if dictionary.objectForKey("mid")
        {
            self.status_mid = Int(dictionary.objectForKey("mid")! as! String)
        }
        if dictionary.objectForKey("idstr")
        {
            self.idstr = dictionary.objectForKey("idstr") as? String
        }
        if dictionary.objectForKey("text")
        {
            self.text = dictionary.objectForKey("text") as? String
        }
        if dictionary.objectForKey("source")
        {
            self.source = dictionary.objectForKey("source") as? String
        }
        if dictionary.objectForKey("favorited")
        {
            self.favorited = (dictionary.objectForKey("favorited") as? Bool)!
        }
        if dictionary.objectForKey("truncated")
        {
            self.truncated = (dictionary.objectForKey("truncated") as? Bool)!
        }
        if dictionary.objectForKey("thumbnail_pic")
        {
            self.thumbnail_pic = dictionary.objectForKey("thumbnail_pic") as? String
        }
        if dictionary.objectForKey("bmiddle_pic")
        {
            self.bmiddle_pic = dictionary.objectForKey("bmiddle_pic") as? String
        }
        if dictionary.objectForKey("original_pic")
        {
            self.original_pic = dictionary.objectForKey("original_pic") as? String
        }
        if dictionary.objectForKey("reposts_count")
        {
            self.reposts_count = Int(dictionary.objectForKey("reposts_count")! as! String)
        }
        if dictionary.objectForKey("comments_count")
        {
            self.comments_count = Int(dictionary.objectForKey("comments_count")! as! String)
        }
        if dictionary.objectForKey("attitudes_count")
        {
            self.attitudes_count = Int(dictionary.objectForKey("attitudes_count")! as! String)
        }
        if dictionary.objectForKey("pic_urls")
        {
            self.pic_urls = NSMutableArray(capacity: 9)
            for _: String in self.pic_urls!
            {
                self.pic_urls.addObject(_)
            }
        }
        
    }















    
    
    
    
    
    
    
    
    
}
