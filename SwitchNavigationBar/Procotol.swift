//
//  Procotol.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/6.
//  Copyright © 2017年 cb. All rights reserved.
//

import Foundation
import UIKit

enum ThemeStyle: String {
    case pink
    case white
}

protocol NavTheme {
    
    var navTitle: String { get }
    
    func navTheme(style: ThemeStyle)
}

extension NavTheme where Self: UIViewController {
    
    func navTheme(style: ThemeStyle) {
        
        switch style {
        case .pink:
            
            self.navigationItem.title = navTitle
            self.pinkTheme()
            print(navTitle)
            print(style)
        case .white:
            
            self.whiteTheme()
            print(style)

        }
    }
    
    func whiteTheme() {

        

    }
    
    func pinkTheme() {
        var radius = Radius.init(topLeftRadius: 0, topRightRadius: 0, bottomLeftRadius: 0, bottomRightRadius: 0)
        
        let bgImg = UIImage.drawImage(size: CGSize.init(width: 1, height: 1), borderWidth: 0, borderColor: .clear, radius: &radius, backgroundColor: .red)
        
        
        self.navigationController?.navigationBar.setBackgroundImage(bgImg, for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                                        NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
        if (self.navigationController?.viewControllers.count)! > 1 {
            self.initBackBtn()
        }
        
    }
    
    
    func initBackBtn() {
        
        let backBtn = BlockButton() {
            if (self.navigationController?.viewControllers.count)! > 0 {
                self.navigationController?.popViewController(animated: true)
            }
        }
        backBtn.adjustsImageWhenHighlighted = false
        backBtn.setBackgroundImage(#imageLiteral(resourceName: "icon_arrow_white"), for: .normal)
        backBtn.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
        
    }
}
