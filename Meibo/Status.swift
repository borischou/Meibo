//
//  Status.swift
//  Meibo
//
//  Created by Zhouboli on 15/8/21.
//  Copyright (c) 2015年 Boris. All rights reserved.
//

import UIKit

class Status: NSObject
{
    
    var
        created_at: NSString?,
        status_id: Int?,
        status_mid: Int?,
        idstr: NSString?,
        text: NSString?,
        source: NSString?,
        favorited: Bool?,
        truncated: Bool?,
        thumbnail_pic: NSString?,
        bmiddle_pic: NSString?,
        original_pic: NSString?,
        reposts_count: Int?,
        comments_count: Int?,
        attitudes_count: Int?,
        height: CGFloat?,
        heightForWaterfall: CGFloat?,
        user: User?,
        retweeted_status: Status?,
        pic_urls: NSMutableArray?
    
    func initWithDictionary(dictionary: NSDictionary) -> Status
    {
        self = super.init()
        
        if self != nil
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
            
            self.calculateStatusHeight()
            self.calculateWaterfallHeight()
        }
        
        return self
    }
    
    func convertNSDictionary() -> NSDictionary
    {
        let dict: NSDictionary = ["created_at": self.created_at!, "id": NSNumber(integer: self.status_id!), "mid": NSNumber(integer: self.status_mid!), "idstr": self.idstr!, "text": self.text!, "source": self.source!, "favorited": NSNumber(bool: self.favorited!), "truncated": NSNumber(bool: self.truncated!), "thumbnail_pic": self.thumbnail_pic!, "bmiddle_pic": self.bmiddle_pic!, "original_pic": self.original_pic!, "reposts_count": NSNumber(integer: self.reposts_count!), "comments_count": NSNumber(integer: self.comments_count!), "attitudes_count": NSNumber(integer: self.attitudes_count!)]
        
        if self.pic_urls?.count > 0
        {
            let urls: NSMutableArray = []
            for url in urls
            {
                urls.addObject(["thumbnail_pic": url as! NSString])
            }
            dict.setValue(urls, forKey: "pic_urls")
        }
        dict.setValue(self.user?.convertNSDictionary(), forKey: "user")
        dict.setValue(self.retweeted_status?.convertNSDictionary(), forKey: "retweeted_status")
        
        return dict
    }
    
    func calculateStatusHeight()
    {
        self.height = Utils.getHeightForCell(self.text! as String, statusImageNumber: self.pic_urls!.count, retweetScreenName: self.retweeted_status!.user!.screen_name!, retweetText: self.retweeted_status!.text! as String, retweetImageNumber: self.retweeted_status!.pic_urls!.count)
    }
    
    func calculateWaterfallHeight()
    {
        self.heightForWaterfall = Utils.heightForWaterfallCell(self, textWidth: cellWidthForWaterfall - 4)
    }
}
