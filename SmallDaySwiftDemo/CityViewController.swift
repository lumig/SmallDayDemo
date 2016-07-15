//
//  CityViewController.swift
//  SmallDaySwiftDemo
//
//  Created by Lumig on 16/7/14.
//  Copyright © 2016年 www.FangPinHui.com. All rights reserved.
//

import UIKit

class CityViewController: MainViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var cityName: String!
    var collection:UICollectionView!
    var layout = UICollectionViewFlowLayout()
    
    lazy var domesticCitys:NSMutableArray? = {
        let arr = NSMutableArray (array: ["上海","北京","芜湖","杭州","广州","深圳"
            ])
        return arr
    }()
    
    lazy var overSeasCitys:NSMutableArray? = {
        let arr = NSMutableArray (array: ["英国","美国","迪拜","巴黎","韩国","泰国"
            ])
        return arr
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
        setCollectionView()
        
        let lastSelectedCityIndexPath =  selectedCurrentCity()
        collection.selectItemAtIndexPath(lastSelectedCityIndexPath, animated: true, scrollPosition: .None)
        
        // Do any additional setup after loading the view.
    }
    
    private func selectedCurrentCity() -> NSIndexPath {
        if let currentCityName = self.cityName {
            for var i = 0; i < domesticCitys!.count; i++ {
                if currentCityName == domesticCitys![i] as! String {
                    return NSIndexPath(forItem: i, inSection: 0)
                }
            }
            
            for var i = 0; i < overSeasCitys!.count; i++ {
                if currentCityName == overSeasCitys![i] as! String {
                    return NSIndexPath(forItem: i, inSection: 1)
                }
            }
        }
        
        return NSIndexPath(forItem: 0, inSection: 0)
    }
    
    func setNav()
    {
        view.backgroundColor = Theme.BackGroundColor
        navigationItem.title = "选择城市"
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "取消", style: .Done, target: self, action: "cancelBtnDidClick")
    }
    
    func setCollectionView(){
        //设置布局
        let itemW = SCREENWIDTH/3.0 - 1.0
        let itemH: CGFloat = 50
        layout.itemSize = CGSizeMake(itemW, itemH)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.headerReferenceSize = CGSizeMake(view.width, 60)
        
        //设置collectionview
        collection = UICollectionView (frame: view.bounds, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.selectItemAtIndexPath(NSIndexPath (forItem: 1, inSection: 0), animated: true, scrollPosition: .None)
        collection.backgroundColor = UIColor.colorWith(247, green: 247, blue: 247, alpha: 1)
        collection.registerClass(CityHeadCollectionReusableView.self , forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
        collection.registerClass(cityFooterCollectionReusableView.self , forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "FooterView")
        collection.alwaysBounceVertical = true
        view.addSubview(collection!)
        
        
    }
    
    
    
    func cancelBtnDidClick()
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //mark -- collectionview delegate/datasoure
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return domesticCitys!.count
        }
        else
        {
            return overSeasCitys!.count
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collection.dequeueReusableCellWithReuseIdentifier("cllID", forIndexPath: indexPath)as! CityCollectionViewCell
        
        if indexPath.row == 0 {
            cell.cityName = domesticCitys!.objectAtIndex(indexPath.row) as! String
        }
        else
        {
            cell.cityName = overSeasCitys!.objectAtIndex(indexPath.row) as! String
        }
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionFooter && indexPath.section == 1 {
            
            let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: "FooterView", forIndexPath: indexPath) as! cityFooterCollectionReusableView
            footerView.frame.size.height = 80
            
            return footerView
        }
        else
        {
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", forIndexPath: indexPath) as! CityHeadCollectionReusableView
            headerView.frame.size.height = 80
            
            if indexPath.section == 0 {
                headerView.headTilte = "国内城市"
            }
            else
            {
                headerView.headTilte = "国外城市"
            }
            
            return headerView
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellID", forIndexPath: indexPath) as! CityCollectionViewCell
        let currentCity = cell.cityName

        let user = NSUserDefaults.standardUserDefaults()
        
        user.setObject(currentCity, forKey: changeCityName)
        
        if user.synchronize() {
            NSNotificationCenter.defaultCenter().postNotificationName(changeCityNotification, object: currentCity)
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    /// 这方法是UICollectionViewDelegateFlowLayout 协议里面的， 我现在是 默认的flow layout， 没有自定义layout，所以就没有实现UICollectionViewDelegateFlowLayout协议,需要完全手敲出来方法,对应的也有设置header的尺寸方法
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeZero
        } else {
            return CGSizeMake(view.width, 120)
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
