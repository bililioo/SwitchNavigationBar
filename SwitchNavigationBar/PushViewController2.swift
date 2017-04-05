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
        self.navTitle("default")
    }
}
