//
//  Comment.swift
//  Meibo
//
//  Created by Zhouboli on 15/10/26.
//  Copyright © 2015年 Boris. All rights reserved.
//

import Foundation
import UIKit

let
    cAvatarLength: CGFloat = 40,
    cNameHeight: CGFloat = 15,
    cTextWidth: CGFloat = sWidth - 2 * uBigGap - uSmallGap - cAvatarLength,
    mTextWidth: CGFloat = sWidth - 2 * uBigGap

class Comment: NSObject
{
    var
        created_at: NSString?,
        text: NSString?,
        source: NSString?,
        mid: NSString?,
        idstr: NSString?,
        comnt_id: NSInteger?,
        user: User?,
        status: Status?,
        reply_comment: Comment?,
        height: CGFloat?,
        heightForMessage: CGFloat?
    
    func initWithDictionary(dictionary: NSDictionary) -> Comment
    {
        self = super.init()
        
        if self != nil
        {
            self.created_at = dictionary.objectForKey("created_at") as? NSString
            self.text = dictionary.objectForKey("text") as? NSString
            self.source = dictionary.objectForKey("source") as? NSString
            self.mid = dictionary.objectForKey("mid") as? NSString
            self.idstr = dictionary.objectForKey("idstr") as? NSString
            self.comnt_id = (dictionary.objectForKey("id") as? NSString)?.integerValue
            if dictionary.objectForKey("user") != nil
            {
                self.user = dictionary.objectForKey("user") as? User
            }
            if dictionary.objectForKey("status") != nil
            {
                self.status = dictionary.objectForKey("status") as? Status
            }
            if dictionary.objectForKey("reply_comment") != nil
            {
                self.reply_comment = dictionary.objectForKey("reply_comment") as? Comment
            }
            
            self.calculateHeights()
        }
        
        return self
    }
    
    func calculateHeights()
    {
        var replyHeight: CGFloat = 0
        if self.reply_comment != nil && self.reply_comment?.text?.length > 0
        {
            let replySize: CGSize? = self.reply_comment?.text?.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(fontSizeForStatus)])
            replyHeight = uSmallGap + (replySize?.height)!
        }
        
        let textHeight: CGFloat? = Utils.height(self.text!, width: cTextWidth, fontSize: fontSizeForComment)
        self.height = cAvatarLength > (cNameHeight + uSmallGap + textHeight!) ? (uBigGap * 2 + cAvatarLength) : (uBigGap * 2 + cNameHeight + uSmallGap + textHeight!)
        
        let
            part1: CGFloat = Utils.height(self.text!, width: mTextWidth, fontSize: fontSizeForStatus),
            part2: CGFloat = Utils.height("@\(self.status?.user?.screen_name):\(self.status?.text)", width: mTextWidth, fontSize: fontSizeForStatus)
        
        self.heightForMessage = uBigGap * 4 + cAvatarLength + part1 + part2 + replyHeight
    }
}
