//
//  Utils.swift
//  Meibo
//
//  Created by Boris Chow on 10/25/15.
//  Copyright © 2015 Boris. All rights reserved.
//

import Foundation
import UIKit
import Accounts

let
    uBigGap: CGFloat = 5,
    uSmallGap: CGFloat = 10,
    uHeadImgHeight: CGFloat = 50,
    sWidth: CGFloat = UIScreen.mainScreen().bounds.size.width,
    sHeight: CGFloat = UIScreen.mainScreen().bounds.size.height,
    imageHeight: CGFloat = (sWidth - 2 * uBigGap)/3,
    imageHeightForTwo: CGFloat = (sWidth - uBigGap)/2,
    uButtonHeight: CGFloat = sHeight / 25,
    maxHeightForWaterfallCoverPicture: CGFloat = sHeight / 4,
    fontSizeForWaterfall: CGFloat = 16.0,
    fontSizeForStatus: CGFloat = 16.0,
    fontSizeForComment: CGFloat = 13.0,
    cellWidthForWaterfall: CGFloat = (sWidth - 8.0) / 2,
    heightForWaterfallBottom: CGFloat = 15.0,
    smallGapForWaterfall: CGFloat = 2.0,
    bigGapForWaterfall: CGFloat = 4.0,
    wSmallGap: CGFloat = 2.0,
    wBottomLabelHeight: CGFloat = 15.0,

    kBarColor: UIColor = UIColor(red: 59.0/255, green: 59.0/255, blue: 59.0/255, alpha: 1.0),
    kBackgroundColor: UIColor = UIColor(red: 30.0/255, green: 30.0/255, blue: 30.0/255, alpha: 1.0)

extension UIColor
{
    static func customWhite() -> UIColor
    {
        return UIColor(red: 238.0/255, green: 238.0/255, blue: 224.0/255, alpha: 1.0)
    }
    
    static func firebrick() -> UIColor
    {
        return UIColor(red: 139.0/255, green: 26.0/255, blue: 26.0/255, alpha: 1.0)
    }
    
    static func dodgerblue() -> UIColor
    {
        return UIColor(red: 16.0/255, green: 78.0/255, blue: 139.0/255, alpha: 1.0)
    }
    
    static func seagreen() -> UIColor
    {
        return UIColor(red: 46.0/255, green: 139.0/255, blue: 87.0/255, alpha: 1.0)
    }
    
    static func customGreen() -> UIColor
    {
        return UIColor(red: 139.0/255, green: 195.0/255, blue: 74.0/255, alpha: 1.0)
    }
}

extension NSString
{
    static func middlePictureUrlWithThumbUrl(url: NSString) -> NSString
    {
        return url.stringByReplacingOccurrencesOfString("thumbnail", withString: "bmiddle")
    }
    
    static func largePictureUrlWithThumbUrl(url: NSString) -> NSString
    {
        return url.stringByReplacingOccurrencesOfString("thumbnail", withString: "large")
    }
    
    static func formattedNumber(num: NSInteger) -> NSString
    {
        var numStr: NSString?
        
        if num > 0 && num < 1000
        {
            numStr = "\(num)"
        }
        if num > 999 && num < 10000
        {
            numStr = "\(CGFloat(num/1000))"
        }
        if num > 9999 && num < 10000 * 100
        {
            numStr = "\(CGFloat(num/10000))"
        }
        if num >= 10000*100
        {
            numStr = "\(num/(10000*100))"
        }
        
        return numStr!
    }
    
    static func trim(source: NSString) -> NSString
    {
        var text: NSString?
        var result: NSString? = source
        
        if source.length > 0
        {
            let scanner: NSScanner = NSScanner(string: source as String)
            while !scanner.atEnd
            {
                scanner.scanUpToString("<", intoString: nil)
                scanner.scanUpToString(">", intoString: &text)
                result = result!.stringByReplacingOccurrencesOfString("\(text)>", withString: "")
            }
            let regEx: NSString = "<([^>]*)>"
            result = result?.stringByReplacingOccurrencesOfString(regEx as String, withString: "")
        }
        
        return result!
    }
    
    static func formattedTime(time: NSString) -> NSString
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z yyyy"
        formatter.timeZone = NSTimeZone(name: "Asia/Beijing")
        formatter.locale = NSLocale(localeIdentifier: "en_CN")
        
        let date = formatter.dateFromString(time as String)
        let outFormatter = NSDateFormatter()
        outFormatter.timeZone = NSTimeZone(name: "Asia/Beijing")
        outFormatter.dateFormat = "EEE HH:mm:ss yy-MM-dd"
        return outFormatter.stringFromDate(date!)
    }
}

class Utils: NSObject
{
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
        let fontSize = fontSizeForStatus
        
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
    
    static func setupNavigationController(navController: UINavigationController?, viewController: UIViewController)
    {
        if navController != nil
        {
            navController?.navigationBar.barTintColor = kBarColor
            navController?.navigationBar.tintColor = UIColor.customWhite()
            navController?.navigationBar.layer.shadowOpacity = 0.2
            navController?.navigationBar.layer.shadowOffset = CGSizeMake(0, 2)
            navController?.navigationBar.layer.shadowColor = UIColor.blackColor().CGColor
        }
        
        viewController.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.customWhite()]
        viewController.view.backgroundColor = kBackgroundColor
        
        if viewController.isKindOfClass(UITableViewController)
        {
            (viewController as? UITableViewController)?.tableView.separatorStyle = .None
        }
    }
    
    static func statusesWith(data: NSData) -> NSMutableArray
    {
        let statuses: NSMutableArray = []
        var dict: NSDictionary?
        
        do
        {
            dict = try NSJSONSerialization.JSONObjectWithData(data, options: [.AllowFragments]) as? NSDictionary
        }
        catch
        {
            NSLog("error: \(error)")
        }
        
        if dict!.objectForKey("statuses") != nil
        {
            let status_dicts = dict?.objectForKey("statuses") as! NSArray
            for dict in status_dicts
            {
                statuses.addObject(Status().initWithDictionary(dict as! NSDictionary))
            }
        }
        
        return statuses
    }
    
    static func plistPath(filename: NSString) -> NSString
    {
        //获取Library/Caches目录
        let paths: NSArray = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        let cachesDirectory: NSString = paths.firstObject as! NSString
        
        //将文件名拼在目录后面形成完整文件路径
        return cachesDirectory.stringByAppendingPathComponent(cachesDirectory as String)
    }
    
    static func systemAccounts() -> NSArray
    {
        let store = ACAccountStore()
        let type = store.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierSinaWeibo)
        let accounts = store.accountsWithAccountType(type)
        return accounts
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}