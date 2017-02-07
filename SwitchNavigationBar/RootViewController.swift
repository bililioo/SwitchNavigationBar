//
//  RootViewController.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/6.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UINavigationControllerDelegate {

    public var mainTabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nav1: URNavigationController = URNavigationController.init(rootViewController: vc1)
        let nav2: URNavigationController = URNavigationController.init(rootViewController: vc2)
        
        nav1.tabBarItem = UITabBarItem.init(title: "控制器1", image: UIImage.init(named: "fsdf"), tag: 10001)
        nav2.tabBarItem = UITabBarItem.init(title: "控制器2", image: UIImage.init(named: "afs"), tag: 10002)
        
        nav1.delegate = self
        nav2.delegate = self
        
        mainTabBarController.viewControllers = [nav1, nav2]
        self.view.addSubview(mainTabBarController.view)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if navigationController.viewControllers.count == 1 {
            //跟控制器
            navigationController.interactivePopGestureRecognizer?.isEnabled = false
        }
        else {
            //实现导航控制器的滑动返回
            navigationController.interactivePopGestureRecognizer?.isEnabled = true
            navigationController.interactivePopGestureRecognizer?.delegate = nil
        }
    }
    
    lazy var vc1: ViewController = {
        return ViewController()
    }()
    
    lazy var vc2: ViewController2 = {
        return ViewController2()
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
