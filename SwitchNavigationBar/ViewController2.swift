//
//  ViewController2.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/6.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, NavTheme {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navTheme(style: .custom)
        self.view.backgroundColor = .white
        
        self.view.addSubview(btn1)
        btn1.frame = CGRect.init(x: 0, y: 200, width: 200, height: 80)
        self.view.addSubview(btn2)
        btn2.frame = CGRect.init(x: 0, y: 300, width: 200, height: 80)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
            vc.isHiddenNav = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    //MARK: - NavTheme
    func customNavView() -> UIView? {
        return imageView
    }
    
    var navTitle: String = ""
    
    lazy var imageView: UIImageView = {
        var imgView = UIImageView()
        imgView.backgroundColor = .orange
        return imgView
    }()
    
}
