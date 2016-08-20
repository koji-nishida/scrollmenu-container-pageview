//
//  HomeViewController.swift
//  VICU
//
//  Created by n00877 on 2016/08/03.
//  Copyright © 2016年 otsumu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollViewMenu: UIScrollView!
    @IBOutlet weak var btnMenu1: UIButton!
    @IBOutlet weak var btnMenu2: UIButton!
    @IBOutlet weak var btnMenu3: UIButton!
    @IBOutlet weak var btnMenu4: UIButton!
    
    var pageViewController: PageViewController!
    var menuViewControllers: Array<UIViewController> = []
    var selected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PageViewControllerを取得する
        for vc in childViewControllers {
            if vc is PageViewController {
                pageViewController = vc as! PageViewController
            }
            
        }
        
        // PageViewにセットするViewControllerを生成して配列に入れる
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstViewController = storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
        let secondViewController = storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        let thirdViewController = storyboard.instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
        let fourthViewController = storyboard.instantiateViewControllerWithIdentifier("FourthViewController") as! FourthViewController
        menuViewControllers.append(firstViewController)
        menuViewControllers.append(secondViewController)
        menuViewControllers.append(thirdViewController)
        menuViewControllers.append(fourthViewController)
        
        // 初期表示をメニュー2(SecondViewController)にする
        pageViewController.setViewControllers([menuViewControllers[1]], direction: .Forward, animated: false, completion: nil)
        selected = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func actionMenu1(sender: AnyObject) {
        self.btnMenu1.enabled = false
        self.btnMenu2.enabled = true
        self.btnMenu3.enabled = true
        self.btnMenu4.enabled = true
        
        // 一番左までスクロール
        scrollViewMenu.setContentOffset(CGPointMake(0, 0), animated: true);
        
        // 表示切り替え
        pageViewController!.setViewControllers([menuViewControllers[0]], direction: .Reverse, animated: true, completion: nil)
        
        selected = 0
        
    }
    
    @IBAction func actionMenu2(sender: AnyObject) {
        self.btnMenu1.enabled = true
        self.btnMenu2.enabled = false
        self.btnMenu3.enabled = true
        self.btnMenu4.enabled = true
        
        // 一番左までスクロール
        scrollViewMenu.setContentOffset(CGPointMake(0, 0), animated: true);
        
        // 表示切り替え（前回選択していたメニューの位置に応じてアニメーションの向きを設定）
        if (selected < 1) {
            pageViewController!.setViewControllers([menuViewControllers[1]], direction: .Forward, animated: true, completion: nil)
        } else {
            pageViewController!.setViewControllers([menuViewControllers[1]], direction: .Reverse, animated: true, completion: nil)
        }
        
        selected = 1
        
    }
    
    @IBAction func actionMenu3(sender: AnyObject) {
        self.btnMenu1.enabled = true
        self.btnMenu2.enabled = true
        self.btnMenu3.enabled = false
        self.btnMenu4.enabled = true

        // 一番右までスクロール
        let scrollWidth = scrollViewMenu.contentSize.width - scrollViewMenu.frame.size.width
        scrollViewMenu.setContentOffset(CGPointMake(scrollWidth, 0), animated: true);
        
        // 表示切り替え（前回選択していたメニューの位置に応じてアニメーションの向きを設定）
        if (selected < 2) {
            pageViewController!.setViewControllers([menuViewControllers[2]], direction: .Forward, animated: true, completion: nil)
        } else {
            pageViewController!.setViewControllers([menuViewControllers[2]], direction: .Reverse, animated: true, completion: nil)
        }
        
        selected = 2
        
    }
    
    @IBAction func actionMenu4(sender: AnyObject) {
        self.btnMenu1.enabled = true
        self.btnMenu2.enabled = true
        self.btnMenu3.enabled = true
        self.btnMenu4.enabled = false

        // 一番右までスクロール
        let scrollWidth = scrollViewMenu.contentSize.width - scrollViewMenu.frame.size.width
        scrollViewMenu.setContentOffset(CGPointMake(scrollWidth, 0), animated: true);
 
        // 表示切り替え
        pageViewController!.setViewControllers([menuViewControllers[3]], direction: .Forward, animated: true, completion: nil)
        
        selected = 3
        
    }
    
    
}