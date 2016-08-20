//
//  HomePageViewController.swift
//  VICU
//
//  Created by n00877 on 2016/08/19.
//  Copyright © 2016年 otsumu. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var mainViewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        return nil
    }
}

