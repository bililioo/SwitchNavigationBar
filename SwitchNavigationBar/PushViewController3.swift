//
//  PushViewController3.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/7.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

class PushViewController3: UIViewController, NavTheme {

    public var isHiddenNav: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(isHiddenNav, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.navTheme(style: .custom)
    }
    
    func customNavView() -> UIView? {
        let view = UIView()
        view.backgroundColor = .orange
        view.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: 64)
        
        let label = UILabel()
        label.text = "自定义"
        label.backgroundColor = .clear
        label.textColor = .white
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
        
        return view
    }

}
