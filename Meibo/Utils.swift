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
let imageHeight: CGFloat = (sWidth - 2 * uBigGap)/3
let imageHeightForTwo: CGFloat = (sWidth - uBigGap)/2
let uButtonHeight: CGFloat = sHeight / 25
let maxHeightForWaterfallCoverPicture: CGFloat = sHeight / 4
let fontSizeForWaterfall: CGFloat = 16.0
let fontSizeForStatus: CGFloat = 16.0
let fontSizeForComment: CGFloat = 13.0
let cellWidthForWaterfall: CGFloat = (sWidth - 8.0) / 2
let heightForWaterfallBottom: CGFloat = 15.0
let smallGapForWaterfall: CGFloat = 2.0
let bigGapForWaterfall: CGFloat = 4.0
let wSmallGap: CGFloat = 2.0
let wBottomLabelHeight: CGFloat = 15.0

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
        
        //转发微博
        if !retweetScreenName.isEmpty
        {
            //转发微博文本
            height += uBigGap + Utils.height("@\(retweetScreenName):\(retweetText)", width: sWidth - 2 * uBigGap, fontSize: fontSize)
            
            //转发微博配图
            if retweetImageNumber > 0
            {
                height += uSmallGap + Utils.heightForImages(retweetImageNumber)
            }
        }
        
        //微博底部按钮
        height += uSmallGap + uButtonHeight
        
        return height
    }
    
    static func layoutImageViews(views: NSArray, imageNumber: NSInteger, topOffset: CGFloat) -> CGFloat
    {
        for view in views
        {
            (view as? UIImageView)!.frame = CGRectZero
        }
        if imageNumber == 0
        {
            return 0.0
        }
        if imageNumber == 1
        {
            let view: UIImageView = (views.firstObject as? UIImageView)!
            view.frame = CGRectMake(uBigGap, topOffset + uSmallGap, imageHeightForTwo, imageHeightForTwo)
            return uSmallGap + imageHeightForTwo
        }
        if imageNumber == 2
        {
            (views[0] as? UIImageView)!.frame = CGRectMake(0, topOffset + uSmallGap, imageHeightForTwo, imageHeightForTwo)
            (views[1] as? UIImageView)!.frame = CGRectMake(imageHeightForTwo + topOffset + uSmallGap, topOffset + uSmallGap, imageHeightForTwo, imageHeightForTwo)
            return uSmallGap + imageHeightForTwo
        }
        if imageNumber == 3
        {
            for var i = 0; i < imageNumber; i++
            {
                (views[i] as? UIImageView)!.frame = CGRectMake(CGFloat(i) * (imageHeight + uSmallGap), topOffset + uSmallGap, imageHeight, imageHeight)
            }
            return uSmallGap + imageHeight
        }
        if imageNumber == 4
        {
            (views[0] as? UIImageView)!.frame = CGRectMake(0, topOffset + uSmallGap, imageHeightForTwo, imageHeightForTwo)
            (views[1] as? UIImageView)!.frame = CGRectMake(imageHeightForTwo + uSmallGap, topOffset + uSmallGap, imageHeightForTwo, imageHeightForTwo)
            (views[2] as? UIImageView)!.frame = CGRectMake(0, topOffset + 2 * uSmallGap + imageHeightForTwo, imageHeightForTwo, imageHeightForTwo)
            (views[3] as? UIImageView)!.frame = CGRectMake(imageHeightForTwo + uSmallGap, topOffset + 2 * uSmallGap + imageHeightForTwo, imageHeightForTwo, imageHeightForTwo)
        }
        if imageNumber > 4 && imageNumber <= 6
        {
            for var i = 0; i < 3; i++
            {
                (views[i] as? UIImageView)!.frame = CGRectMake(CGFloat(i) * (imageHeight + uSmallGap), topOffset + uSmallGap, imageHeight, imageHeight)
            }
            for var i = 0; i < imageNumber - 3; i++
            {
                (views[3 + i] as? UIImageView)!.frame = CGRectMake(CGFloat(i) * (imageHeight + uSmallGap), topOffset + uSmallGap, imageHeight, imageHeight)
            }
            return uSmallGap * 2.0 + imageHeight * 2.0
        }
        if (imageNumber >= 7 && imageNumber <= 9)
        {
            for var i = 0; i < 3; i++
            {
                (views[i] as? UIImageView)!.frame = CGRectMake(CGFloat(i) * (imageHeight + uSmallGap), topOffset + uSmallGap, imageHeight, imageHeight)
            }
            for var i = 0; i < 3; i++
            {
                (views[3 + i] as? UIImageView)!.frame = CGRectMake(CGFloat(i) * (imageHeight + uSmallGap), topOffset + uSmallGap + imageHeight + uSmallGap, imageHeight, imageHeight)
            }
            for var i = 0; i < imageNumber - 6; i++
            {
                (views[6 + i] as? UIImageView)!.frame = CGRectMake(CGFloat(i) * (imageHeight + uSmallGap), topOffset + uSmallGap + (imageHeight + uSmallGap) * 2, imageHeight, imageHeight)
            }
            return uSmallGap * 3 + imageHeight * 3;
        }
        return 0.0
    }
    
    static func heightForWaterfallCell(status: Status, textWidth: CGFloat) -> CGFloat
    {
        var height: CGFloat = 0
        let fontSize: CGFloat = fontSizeForWaterfall
        
        //封面图片
        if status.pic_urls?.count > 0 || status.retweeted_status?.pic_urls?.count > 0
        {
            height += maxHeightForWaterfallCoverPicture
        }
        
        //微博文本
        height += wSmallGap
        height += Utils.height("@\(status.user?.screen_name):\(status.text)", width: textWidth, fontSize: fontSize)
        
        //转发微博文本
        if status.retweeted_status != nil && status.retweeted_status?.pic_urls?.count < 1
        {
            height += wSmallGap
            height += Utils.height("@\(status.retweeted_status?.user?.screen_name):\(status.retweeted_status?.text)", width: textWidth, fontSize: fontSize)
        }
        
        //底部状态标签
        height += wSmallGap
        height += wBottomLabelHeight
        height += wSmallGap
        
        return height
    }
    
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}