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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func btnClicked() {
        if self.block != nil {
            self.block!()
        }
    }
}
