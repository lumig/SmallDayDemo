//
//  UIColor+Helper.swift
//  SmallDaySwiftDemo
//
//  Created by Lumig on 16/7/15.
//  Copyright © 2016年 www.FangPinHui.com. All rights reserved.
//

import Foundation
import UIKit

// UIColor的扩展
extension UIColor {
    class func colorWith(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        return color
    }
    
}

