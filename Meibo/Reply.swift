//
//  Reply.swift
//  Meibo
//
//  Created by Zhouboli on 15/10/27.
//  Copyright © 2015年 Boris. All rights reserved.
//

import Foundation

class Reply: NSObject {
    var
    source: NSString?,
    floor_num: NSInteger?,
    reply_id: NSString?,
    idstr: NSString?,
    mid: NSString?,
    source_allowclick: Bool?,
    source_type: NSInteger?,
    text: NSString?,
    created_at: NSString?,
    user: User?
    
    func initWithDictionary(dictionary: NSDictionary) -> Reply
    {
        self.source = dictionary.objectForKey("source") as? NSString
        self.floor_num = dictionary.objectForKey("floor_num")?.integerValue
        self.reply_id = dictionary.objectForKey("id") as? NSString
        self.idstr = dictionary.objectForKey("idstr") as? NSString
        self.mid = dictionary.objectForKey("mid") as? NSString
        self.source_allowclick = dictionary.objectForKey("source_allowclick")?.boolValue
        self.source_type = dictionary.objectForKey("source_type")?.integerValue
        self.text = dictionary.objectForKey("text") as? NSString
        self.created_at = dictionary.objectForKey("created_at") as? NSString
        self.user = dictionary.objectForKey("user") as? User
        
        return self
    }
}