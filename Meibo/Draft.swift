//
//  Draft.swift
//  Meibo
//
//  Created by Zhouboli on 15/10/26.
//  Copyright © 2015年 Boris. All rights reserved.
//

import Foundation
import UIKit

enum DraftType: NSInteger
{
    case DraftTypeOriginal = 0, DraftTypeComment, DraftTypeRepost, DraftTypeReply
}

class Draft: NSObject {
    var
    images: NSMutableArray?, //发送微博时的图片(NSData)
    params: NSDictionary?, //发送所需参数
    text: NSString?, //草稿文字
    time: NSString?, //草稿撰写时间
    url: NSString?, //发送目标的url
    draftType: NSInteger?, //草稿类型
    height: CGFloat? //提前计算好所需的cell高度
    
    func initWithDictionary(dictionary: NSDictionary) -> Draft
    {
        self.text = dictionary.objectForKey("text") as? NSString
        self.draftType = dictionary.objectForKey("flag")?.integerValue
        self.params = dictionary.objectForKey("params") as? NSDictionary
        self.time = dictionary.objectForKey("time") as? NSString
        self.url = dictionary.objectForKey("url") as? NSString
        self.height = self.draftHeight()
        
        return self
    }
    
    func draftHeight() -> CGFloat
    {
        if self.draftType != DraftType.DraftTypeOriginal.rawValue //可能有original字段
        {
            let allKeys: NSArray = (self.params?.allKeys)!
            if allKeys.containsObject("original")
                && self.params?.objectForKey("original") != nil
                && self.params?.objectForKey("original")?.isEqualToString("") != nil
            {
                return 105
            }
        }
        return 80
    }
    
    func convertNSDictionary() -> NSDictionary
    {
        return ["text": self.text!, "flag": NSNumber(integer: self.draftType!), "url": self.url!, "images": self.images!, "params": self.params!, "time": self.time!]
    }
}