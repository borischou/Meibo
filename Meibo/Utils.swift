//
//  Utils.swift
//  Meibo
//
//  Created by Boris Chow on 10/25/15.
//  Copyright © 2015 Boris. All rights reserved.
//

import Foundation
import UIKit

let uBigGap: CGFloat = 5
let uSmallGap: CGFloat = 10
let uHeadImgHeight: CGFloat = 50
let sWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
let sHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
let imageHeight = (sWidth - 2 * uBigGap)/3
let imageHeightForTwo = (sWidth - uBigGap)/2

class Utils: NSObject {
    
    static func fontForStatus() -> CGFloat
    {
        return 16.0
    }
    
    static func height(str: NSString, width: CGFloat, fontSize: CGFloat) -> CGFloat
    {
        if str.length == 0
        {
            return 0
        }
        let parastyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        parastyle.lineBreakMode = .ByWordWrapping
        parastyle.lineSpacing = 2.0
        let strRect: CGRect = str.boundingRectWithSize(CGSizeMake(width, 5000), options: [.UsesLineFragmentOrigin, .UsesFontLeading], attributes: [NSFontAttributeName: UIFont.systemFontOfSize(fontSize),
            NSParagraphStyleAttributeName: parastyle], context: nil)
        let strSize: CGSize = strRect.size
        return strSize.height
    }
    
    static func heightForImages(count: NSInteger) -> CGFloat
    {
        var height: CGFloat = 0
        
        if count == 1 || count == 2
        {
            height = imageHeightForTwo
        }
        if count == 3
        {
            height = imageHeight
        }
        if count == 4
        {
            height = imageHeightForTwo * 2 + uSmallGap
        }
        if count > 4 && count <= 6
        {
            height = imageHeight * 2 + uSmallGap
        }
        if count >= 7 && count <= 9
        {
            height = imageHeight * 3 + uSmallGap * 2
        }
        
        return height
    }
    
    static func getHeightForCell(text: String, statusImageNumber: NSInteger, retweetScreenName: String, retweetText: String, retweetImageNumber: NSInteger) -> CGFloat
    {
        var height: CGFloat = 0
        let fontSize = Utils.fontForStatus()
        
        //头像
        height += uBigGap + uHeadImgHeight
        
        //微博文本
        height += uBigGap + Utils.height(text, width: sWidth - uBigGap * 2, fontSize: fontSize)
        
        //微博配图
        if statusImageNumber > 0
        {
            height += uSmallGap + Utils.heightForImages(statusImageNumber)
        }
        
        
        
        return height
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}