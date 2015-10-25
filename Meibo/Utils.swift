//
//  Utils.swift
//  Meibo
//
//  Created by Boris Chow on 10/25/15.
//  Copyright © 2015 Boris. All rights reserved.
//

import Foundation
import UIKit

let uBigGap = 5
let uSmallGap = 10
let uHeadImgHeight = 50

class Utils: NSObject {
    
    static func fontForStatus() -> Float
    {
        return 16.0
    }
    
    static func height(string: String, width: Float, fontSize: Float) -> Float
    {
        if string.isEmpty
        {
            return 0
        }
        var parastyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        parastyle.lineBreakMode = .ByWordWrapping
        parastyle.lineSpacing = 2.0
        var strsize: CGSize = 
    }
    
    static func getHeightForCell(text: String, statusImageNumber: NSInteger, retweetScreenName: String, retweetText: String, retweetImageNumber: NSInteger) -> Float
    {
        var height: Float = 0
        var fontSize = Utils.fontForStatus()
        height += uBigGap+uHeadImgHeight
        
    }
}