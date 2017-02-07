//
//  ViewController2.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/6.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, NavTheme {

    var navTitle: String = "白色"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navTheme(style: .white)
        self.view.backgroundColor = .white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
