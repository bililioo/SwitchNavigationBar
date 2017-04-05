//
//  Procotol.swift
//  SwitchNavigationBar
//
//  Created by Bin on 17/2/6.
//  Copyright © 2017年 cb. All rights reserved.
//

import Foundation
import UIKit


/// 打印指针地址
///
/// - Parameter ptr: parameter
func printPointer<T>(_ ptr: UnsafePointer<T>) {
    print(ptr)
}

enum ThemeStyle: String {
    case `default`
    case custom
    case white
}

protocol NavTheme {
    
    /// 导航栏标题
    ///
    /// - Parameter title: String
    func navTitle(_ title: String)
    
    /// 导航栏风格
    ///
    /// - Parameter style: enum ThemeStyle
    func navTheme(style: ThemeStyle)
    
    
    /// ThemeStyle == .custom时，需要实现此方法
    ///
    /// - Returns: 自定义导航栏View
    func customNavView() -> UIView?
}

extension NavTheme where Self: UIViewController {
    
    func defaultBgImage() -> UIImage {
        return UIImage.createImage(color: UIColor.rgbColor(red: 251, green: 142, blue: 195))
    }
    
    func whiteBgImage() -> UIImage {
        return UIImage.createImage(color: .white)
    }
    
    func customNavView() -> UIView? {
        return nil
    }
    
    func navTheme(style: ThemeStyle) {
        switch style {
        case .default:
            self.setNav(self.defaultBgImage())
        case .custom:
            self.customTheme()
        case .white:
            self.setNav(self.whiteBgImage(), titleColor: .black)
        }
    }
    
    func navTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    private func customTheme() {
        if let customNavView: UIView = self.customNavView() {
            customNavView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
            self.view.addSubview(customNavView)
        }
    }
    
    private func initBackBtn(_ backImage: UIImage) {
        
        
        let backBtn = BlockButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        backBtn.adjustsImageWhenHighlighted = false
        backBtn.setBackgroundImage(backImage, for: .normal)
        backBtn.block = {
            [weak self] in
            if (self?.navigationController?.viewControllers.count)! > 0 {
                self?.navigationController?.popViewController(animated: true)
            }
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
    }
    
    private func setNav(_ backgroundImage: UIImage, titleColor: UIColor = UIColor.white) {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: titleColor]
        
        //        NSFontAttributeName: UIFont.systemFont(ofSize: 18)
        if (self.navigationController?.viewControllers.count)! > 1 {
            if backgroundImage == self.defaultBgImage() {
                self.initBackBtn(#imageLiteral(resourceName: "icon_arrow_white"))
            } else {
                self.initBackBtn(#imageLiteral(resourceName: "icon_arrow_white"))
            }
            
        }
    }
}
