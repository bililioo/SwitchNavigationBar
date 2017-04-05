//
//  PushViewController.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/7.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class PushViewController: UIViewController, NavTheme {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navTheme(style: .custom)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
