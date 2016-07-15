//
//  CityCollectionReusableView.swift
//  SmallDaySwiftDemo
//
//  Created by Lumig on 16/7/15.
//  Copyright © 2016年 www.FangPinHui.com. All rights reserved.
//


//选择城市的头部和尾部
import UIKit


class CityHeadCollectionReusableView: UICollectionReusableView {

    var headTitleLabel: UILabel?
    var headTilte: String?
        {
        didSet {
            headTitleLabel?.text = headTilte
            headTitleLabel?.font = Theme.FONT16
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        super.init(frame: frame)
        initSubView()
    }
    
    
    func initSubView(){
        headTitleLabel?.textAlignment = .Center
        headTitleLabel?.font = Theme.FONT16
        headTitleLabel?.textColor = UIColor.blackColor()
        addSubview(headTitleLabel!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.headTitleLabel?.frame = self.bounds
    }

    
}


class cityFooterCollectionReusableView:UICollectionReusableView
{
    var footerTitleLabel:UILabel = UILabel()
//    var footerTitle : String?
//     {
//        didSet {
//            footerTitleLabel?.text = footerTitle
//            footerTitleLabel?.font = Theme.FONT13
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initSubView()
    {
        footerTitleLabel = UILabel()
        footerTitleLabel.textColor = UIColor.grayColor()
        footerTitleLabel.textAlignment = .Center
        footerTitleLabel.font = Theme.FONT13
        footerTitleLabel.text = "更多城市，敬请期待..."
        addSubview(footerTitleLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        footerTitleLabel.frame = self.bounds
    }
}







