//
//  BlockButton.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/7.
//  Copyright © 2017年 cb. All rights reserved.
//

import UIKit

typealias ButtonBlock = ()->()

class BlockButton: UIButton {

    var block: ButtonBlock?
    
    convenience init(block: @escaping ButtonBlock) {
        self.init()
        self.block = block
        self.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }
    
    convenience init(type: UIButtonType, block: @escaping ButtonBlock) {
        self.init(type: type, block: block)
        self.block = block
        self.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }
    
    
    
    func btnClicked() {
        guard let block = block else {
            return
        }
        block()
    }

}
