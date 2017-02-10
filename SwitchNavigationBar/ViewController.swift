//
//  ViewController.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/6.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NavTheme {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navTheme(style: .default)
        
        self.view.addSubview(btn)
        btn.frame = CGRect.init(x: 0, y: 70, width: 120, height: 40)
        
        self.view.addSubview(btn1)
        btn1.frame = CGRect.init(x: 0, y: 200, width: 200, height: 80)
        self.view.addSubview(btn2)
        btn2.frame = CGRect.init(x: 0, y: 300, width: 200, height: 80)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonClicked() {
        self.navigationController?.pushViewController(PushViewController(), animated: true)
    }
    
    lazy var btn: UIButton = {
        var tempBtn = UIButton.init(type: .system)
        tempBtn.setTitle("跳转到空导航栏", for: .normal)
        tempBtn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        return tempBtn
    }()

    lazy var btn1: UIButton = {
        var btn = BlockButton.init(type: .system)
        btn.setTitle("跳转到default导航栏控制器", for: .normal)
        btn.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        var btn = BlockButton.init(type: .system)
        btn.setTitle("跳转到自定义导航栏控制器", for: .normal)
        btn.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        return btn
    }()
    
    func btnClicked(btn: UIButton) {
        
        if btn == btn1 {
            self.navigationController?.pushViewController(PushViewController2(), animated: true)
        } else {
            let vc = PushViewController3()
            vc.isHiddenNav = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    //MARK: - NavTheme
    var navTitle: String = "红色"
}

