//
//  MainViewController.swift
//  SmallDaySwiftDemo
//
//  Created by Lumig on 16/7/14.
//  Copyright © 2016年 www.FangPinHui.com. All rights reserved.
//

import UIKit

public let changeCityName : String = "changeCityName"
public let changeCityNotification: String = "changeCityNotification"

class MainViewController: UIViewController {
    
    var cityBtn : TxtImgButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func addSubView()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"changeCity:" , name: changeCityNotification, object: nil)
        
        cityBtn = TxtImgButton.init(frame: CGRectMake(0, 20, 80, 44))
        
        let user = NSUserDefaults.standardUserDefaults()
        if let currentCity = user.objectForKey(changeCityName) as?String
        {
            cityBtn.setTitle(currentCity, forState: .Normal)
        }
        else
        {
            cityBtn.setTitle("上海", forState: .Normal)
        }
        
        cityBtn.titleLabel?.font = Theme.FONT13
        cityBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        cityBtn.setImage(UIImage.init(named: "home_down"), forState: .Normal)
        cityBtn.addTarget(self, action: #selector(cityBtnDidClick), forControlEvents: .TouchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: cityBtn)
        
    }
    
    func cityBtnDidClick()
    {
        let vc = CityViewController()
        presentViewController(vc, animated: true, completion: nil)
        print("cityBtnDidClick")
    }
    
    func changeCity(noti:NSNotification)
    {
        if let currentCityName = noti.object as? String {
            self.cityBtn.setTitle(currentCityName, forState: .Normal)
        }
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    
    class TxtImgButton :UIButton
    {
        override init(frame: CGRect) {
            super.init(frame: frame)
            titleLabel?.font = Theme.FONT13
            titleLabel?.contentMode = .Center
            imageView?.contentMode = .Left
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
