//
//  PushViewController2.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/7.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class PushViewController2: UIViewController, NavTheme {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        self.navTheme(style: .default)
        // Do any additional setup after loading the view.
    }

    //MARK: - NavTheme
    var navTitle: String = "default"
    
    func customNavView() -> UIView? {
        return nil
    }
}
