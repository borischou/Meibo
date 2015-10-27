//
//  Counts.swift
//  Meibo
//
//  Created by Zhouboli on 15/10/27.
//  Copyright © 2015年 Boris. All rights reserved.
//

import Foundation

class Counts: NSObject {
    var
    followers_count: NSInteger?,
    friends_count: NSInteger?,
    statuses_count: NSInteger?
    
    func initWithCounts(counts: NSDictionary) -> Counts
    {
        self.followers_count = counts.objectForKey("followers_count")?.integerValue
        self.friends_count = counts.objectForKey("friends_count")?.integerValue
        self.statuses_count = counts.objectForKey("statuses_count")?.integerValue
        
        return self
    }
}
