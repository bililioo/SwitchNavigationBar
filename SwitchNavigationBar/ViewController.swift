//
//  ViewController.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/6.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NavTheme {

    var navTitle: String = "红色"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navTheme(style: .pink)
        
        self.view.addSubview(btn)
        btn.frame = CGRect.init(x: 0, y: 70, width: 80, height: 40)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClicked() {
        self.navigationController?.pushViewController(PushViewController(), animated: true)
    }
    
    lazy var btn: UIButton = {
        var tempBtn = UIButton.init(type: .system)
        tempBtn.setTitle("点击跳转", for: .normal)
        tempBtn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        return tempBtn
    }()
}

func printPointer<T>(_ ptr: UnsafePointer<T>) {
    print(ptr)
}
