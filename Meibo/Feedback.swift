//
//  Feedback.swift
//  Meibo
//
//  Created by Zhouboli on 15/10/29.
//  Copyright © 2015年 Boris. All rights reserved.
//

import Foundation

class Feedback: NSObject
{
    var
    status_id: NSInteger?,
    comments: NSInteger?,
    reposts: NSInteger?,
    attitudes: NSInteger?
    
    func initWithNSDictionary(dictionary: NSDictionary) -> Feedback
    {
        self = super.init()
        
        if self != nil
        {
            self.status_id = (dictionary.objectForKey("id") as? NSString)?.integerValue
            self.comments = (dictionary.objectForKey("comments") as? NSString)?.integerValue
            self.reposts = (dictionary.objectForKey("reposts") as? NSString)?.integerValue
            self.attitudes = (dictionary.objectForKey("attitudes") as? NSString)?.integerValue
        }
        
        return self
    }
}