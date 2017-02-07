//
//  URNavigationController.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/6.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class URNavigationController: UINavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        } else {
            viewController.hidesBottomBarWhenPushed = false
        }
        super.pushViewController(viewController, animated: animated)
    }

}
