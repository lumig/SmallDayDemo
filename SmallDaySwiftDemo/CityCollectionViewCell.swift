//
//  CityCollectionViewCell.swift
//  SmallDaySwiftDemo
//
//  Created by Lumig on 16/7/15.
//  Copyright © 2016年 www.FangPinHui.com. All rights reserved.
//

//选择城市cell

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    private var textLabel:UILabel = UILabel()
    var cityName: String? {
        didSet{
            textLabel.text = cityName
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setSubView()
    {
        textLabel.font = Theme.FONT12
        textLabel.textAlignment = .Center
        textLabel.textColor = UIColor.blackColor()
        textLabel.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(textLabel)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = self.bounds
    }
    
    
    
    
    
}