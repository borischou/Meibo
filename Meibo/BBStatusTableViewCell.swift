//
//  BBStatusTableViewCell.swift
//  Meibo
//
//  Created by Zhouboli on 15/10/27.
//  Copyright © 2015年 Boris. All rights reserved.
//

import Foundation
import UIKit

class BBStatusTableViewCell: UITableViewCell {
    //个人微博
    var status: Status?
    var nicknameLabel: UILabel?
    var sourceLabel: UILabel?
    var avatarView: UIImageView?
    var vipView: UIImageView?
    var statusImageView: UIImageView?
    var deleteButton: UIButton?
    
    //转发微博
    var repostView: UIView?
    var repostImageView: UIImageView?
    
    //底部控件
    var repostIconView: UIImageView?
    var commentIconView: UIImageView?
    var likeIconView: UIImageView?
    var favIconView: UIImageView?
    var repostNumberLabel: UILabel?
    var commentNumberLabel: UILabel?
    var likeNumberLabel: UILabel?
    
    
}