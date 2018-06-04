//
//  MXSTabViewController.swift
//  MiGo
//
//  Created by mac on 2018/6/4.
//  Copyright © 2018年 MXS. All rights reserved.
//

import UIKit

class MXSTabViewController: UITabBarController {
    let tabBarCount:CGFloat = 4
    
    var main:UIViewController = MXSMainViewController()
    var shop:UIViewController = MXSShopViewController()
    var find:UIViewController = MXSFindViewController()
    var my:UIViewController = MXSMyViewController()
    
    var mainBtn:UIButton = UIButton()
    var shopBtn:UIButton = UIButton()
    var findBtn:UIButton = UIButton()
    var myBtn:UIButton = UIButton()
    
    var mainLabel:UILabel = UILabel()
    var shopLabel:UILabel = UILabel()
    var findLabel:UILabel = UILabel()
    var myLabel:UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAllChildViewController()
    }

    func setUpAllChildViewController(){
        main = MXSMainViewController.init()
        find = MXSFindViewController.init()
        shop = MXSShopViewController.init()
        my = MXSMyViewController.init()
        self.viewControllers = [main,shop,find,my]
        
        self.selectedViewController = self.viewControllers?[0]
        self.tabBar.isTranslucent = false
        
        mainBtn = UIButton.init(frame: CGRect.init(x: 0, y: -5, width: self.view.bounds.width/tabBarCount, height: 49))
        mainBtn.isEnabled = false
        mainBtn.setImage(UIImage.init(named: "首页未选中"), for: UIControlState.normal)
        mainBtn.setImage(UIImage.init(named: "首页未选中"), for: UIControlState.highlighted)
        mainBtn.setImage(UIImage.init(named: "首页选中"), for: UIControlState.disabled)
        mainBtn.addTarget(self, action: #selector(clickMain), for: UIControlEvents.touchUpInside)
        self.tabBar.addSubview(mainBtn)
        
        mainLabel = UILabel.init(frame: CGRect.init(x: 0, y: 37, width: self.view.bounds.width/tabBarCount, height: 8))
        mainLabel.font = UIFont.systemFont(ofSize: 10)
        mainLabel.textAlignment = NSTextAlignment.center
        mainLabel.text = "首页"
        mainLabel.textColor = UIColor.purple
        self.tabBar.addSubview(mainLabel)
        
        shopBtn = UIButton.init(frame: CGRect.init(x: self.view.bounds.width/tabBarCount, y: -5, width: self.view.bounds.width/tabBarCount, height: 49))
        shopBtn.setImage(UIImage.init(named: "觅店未选"), for: UIControlState.normal)
        shopBtn.setImage(UIImage.init(named: "觅店未选"), for: UIControlState.highlighted)
        shopBtn.setImage(UIImage.init(named: "觅店选中"), for: UIControlState.disabled)
        shopBtn.showsTouchWhenHighlighted = false
        shopBtn.addTarget(self, action: #selector(clickShop), for: UIControlEvents.touchUpInside)
        self.tabBar.addSubview(shopBtn)
        
        shopLabel = UILabel.init(frame: CGRect.init(x: self.view.bounds.width/tabBarCount, y: 37, width: self.view.bounds.width/tabBarCount, height: 8))
        shopLabel.font = UIFont.systemFont(ofSize: 10)
        shopLabel.text = "觅店"
        shopLabel.textAlignment = NSTextAlignment.center;
        shopLabel.textColor = UIColor.gray
        self.tabBar.addSubview(shopLabel)
        
        
        findBtn = UIButton.init(frame: CGRect.init(x: (self.view.bounds.width/tabBarCount)*2, y: -5, width: self.view.bounds.width/tabBarCount, height: 49))
        findBtn.setImage(UIImage.init(named: "发现未选"), for: UIControlState.normal)
        findBtn.setImage(UIImage.init(named: "发现未选"), for: UIControlState.highlighted)
        findBtn.setImage(UIImage.init(named: "发现选中"), for: UIControlState.disabled)
        findBtn.showsTouchWhenHighlighted = false
        findBtn.addTarget(self, action: #selector(clickFind), for: UIControlEvents.touchUpInside)
        self.tabBar.addSubview(findBtn)
        
        findLabel = UILabel.init(frame: CGRect.init(x: (self.view.bounds.width/tabBarCount)*2, y: 37, width: self.view.bounds.width/tabBarCount, height: 8))
        findLabel.font = UIFont.systemFont(ofSize: 10)
        findLabel.text = "发现"
        findLabel.textAlignment = NSTextAlignment.center;
        findLabel.textColor = UIColor.gray
        self.tabBar.addSubview(findLabel)
        
        
        myBtn = UIButton.init(frame: CGRect.init(x: (self.view.bounds.width/tabBarCount)*3, y: -5, width: self.view.bounds.width/tabBarCount, height: 49))
        myBtn.setImage(UIImage.init(named: "我的未选"), for: UIControlState.normal)
        myBtn.setImage(UIImage.init(named: "我的未选"), for: UIControlState.highlighted)
        myBtn.setImage(UIImage.init(named: "我的选中"), for: UIControlState.disabled)
        myBtn.showsTouchWhenHighlighted = false
        myBtn.addTarget(self, action: #selector(clickMy), for: UIControlEvents.touchUpInside)
        self.tabBar.addSubview(myBtn)
        
        myLabel = UILabel.init(frame: CGRect.init(x: (self.view.bounds.width/tabBarCount)*3, y: 37, width: self.view.bounds.width/tabBarCount, height: 8))
        myLabel.font = UIFont.systemFont(ofSize: 10)
        myLabel.text = "我的"
        myLabel.textAlignment = NSTextAlignment.center;
        myLabel.textColor = UIColor.gray
        self.tabBar.addSubview(myLabel)

    }
    
    @objc func clickMain(sender:UIButton) {
        sender.isEnabled = false
        self.selectedViewController = main
        findBtn.isEnabled = true
        shopBtn.isEnabled = true
        myBtn.isEnabled = true
        
        mainLabel.textColor = UIColor.purple
        shopLabel.textColor = UIColor.gray
        findLabel.textColor = UIColor.gray
        myLabel.textColor = UIColor.gray
    }
    
    @objc func clickShop(sender:UIButton) {
        sender.isEnabled = false
        self.selectedViewController = shop
        findBtn.isEnabled = true
        mainBtn.isEnabled = true
        myBtn.isEnabled = true
        
        shopLabel.textColor = UIColor.purple
        mainLabel.textColor = UIColor.gray
        findLabel.textColor = UIColor.gray
        myLabel.textColor = UIColor.gray
    }
    
    @objc func clickFind(sender:UIButton) {
        sender.isEnabled = false
        self.selectedViewController = find
        shopBtn.isEnabled = true
        mainBtn.isEnabled = true
        myBtn.isEnabled = true
        
        findLabel.textColor = UIColor.purple
        mainLabel.textColor = UIColor.gray
        shopLabel.textColor = UIColor.gray
        myLabel.textColor = UIColor.gray

    }
    
    @objc func clickMy(sender:UIButton) {
        sender.isEnabled = false
        self.selectedViewController = my
        shopBtn.isEnabled = true
        mainBtn.isEnabled = true
        findBtn.isEnabled = true
        
        myLabel.textColor = UIColor.purple
        mainLabel.textColor = UIColor.gray
        shopLabel.textColor = UIColor.gray
        findLabel.textColor = UIColor.gray
    }
}



















