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
}

var radius = Radius.init(topLeftRadius: 0, topRightRadius: 0, bottomLeftRadius: 0, bottomRightRadius: 0)
let bgImg = UIImage.drawImage(size: CGSize.init(width: 1, height: 1), borderWidth: 0, borderColor: .clear, radius: &radius, backgroundColor: .red)

protocol NavTheme {
    
    /// 导航栏标题
    var navTitle: String { get }
    
    
//    func navTitle(_ title: String)
    
    /// 导航栏风格
    ///
    /// - Parameter style: enum ThemeStyle
    func navTheme(style: ThemeStyle)
    
    
    /// 自定义导航栏, 当ThemeStyle == pink时, 应当传nil
    ///
    /// - Returns: 自定义导航栏View
    func customNavView() -> UIView?
}

extension NavTheme where Self: UIViewController {
    
    func customNavView() -> UIView? {
        return nil
    }
    
    func navTheme(style: ThemeStyle) {
        
        switch style {
        case .default:
            
            self.navigationItem.title = navTitle
            self.defaultTheme()
            print(navTitle)
            print(style)
        case .custom:
            
            self.customTheme()
            print(style)
        }
    }
    
    func customTheme() {

        assert(self.customNavView() != nil, "❎自定义导航栏视图不能为空!")
        
        let customNavView = self.customNavView()
        customNavView?.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        self.view.addSubview(customNavView!)
        
    }
    
    func defaultTheme() {
        
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
    
    func presentAlert() {
        let alert = UIAlertController.init(title: "❎自定义导航栏视图不能为空!", message: nil, preferredStyle: .alert)
        let defaultAction = UIAlertAction.init(title: "确定", style: .default) { (alertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }

}
