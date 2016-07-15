//
//  Theme.swift
//  SmallDaySwiftDemo
//
//  Created by Lumig on 16/7/14.
//  Copyright © 2016年 www.FangPinHui.com. All rights reserved.
//

import UIKit

public let NavigationHeight: CGFloat = 64
public let SCREENWIDTH: CGFloat = UIScreen.mainScreen().bounds.size.width
public let SCREENHEIGHT: CGFloat = UIScreen.mainScreen().bounds.size.height
public let MainBounds:CGRect = UIScreen.mainScreen().bounds
public let rate: CGFloat = SCREENWIDTH/375.0

struct Theme {
    static let FONT10: UIFont = UIFont.systemFontOfSize(rate * 10)
    
    static let FONT11: UIFont = UIFont.systemFontOfSize(11*rate)
    static let FONT12: UIFont = UIFont.systemFontOfSize(12*rate)
    static let FONT13: UIFont = UIFont.systemFontOfSize(13*rate)
    static let FONT14: UIFont = UIFont.systemFontOfSize(14*rate)
    static let FONT15: UIFont = UIFont.systemFontOfSize(15*rate)
    static let FONT16: UIFont = UIFont.systemFontOfSize(16*rate)
    static let FONT17: UIFont = UIFont.systemFontOfSize(17*rate)
    static let FONT18: UIFont = UIFont.systemFontOfSize(18*rate)
    static let FONT19: UIFont = UIFont.systemFontOfSize(19*rate)
    static let FONT20: UIFont = UIFont.systemFontOfSize(20*rate)
    
    static let BackGroundColor: UIColor = UIColor.init(colorLiteralRed: 255, green: 255, blue: 255, alpha: 1)
    
    static let WebBackGroundColor: UIColor = UIColor.init(colorLiteralRed: 245, green: 245, blue: 245, alpha: 1)
    //自定义分享view的高度
    static let ShareViewHeight: CGFloat = rate*215
    
    

}

