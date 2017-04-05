//
//  Extension.swift
//  SwitchNavigationBar
//
//  Created by Bin on 2017/4/5.
//  Copyright © 2017年 cb. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    class func createImage(color: UIColor, rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)) -> UIImage {
        UIGraphicsBeginImageContext(rect.size)
                let context: CGContext = UIGraphicsGetCurrentContext()!
                context.setFillColor(color.cgColor)
                context.fill(rect)
        
                let theImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
                return theImage
    }
}


extension UIColor {
    
    static func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    private static func hexStringColor(hex: String, alpha: CGFloat) -> UIColor {
        
        var red: uint = 0, green: uint = 0, blue: uint = 0
        
        var prefixCount = 0
        
        if hex.hasPrefix("0x") || hex.hasPrefix("0X") {
            prefixCount = 2
        }
        else if hex.hasPrefix("#") {
            prefixCount = 1
        }
        
        func cutString(originString: String, prefix: Int, startOffset: Int, endOffset: Int) -> String {
            let start = originString.index(originString.startIndex, offsetBy: prefix + startOffset)
            let end = originString.index(originString.startIndex, offsetBy: prefix + endOffset)
            
            return originString[start...end]
        }
        
        let redStr = cutString(originString: hex, prefix: prefixCount, startOffset: 0, endOffset: 1)
        let greenStr = cutString(originString: hex, prefix: prefixCount, startOffset: 2, endOffset: 3)
        let blueStr = cutString(originString: hex, prefix: prefixCount, startOffset: 4, endOffset: 5)
        
        Scanner(string: redStr).scanHexInt32(&red)
        Scanner(string: greenStr).scanHexInt32(&green)
        Scanner(string: blueStr).scanHexInt32(&blue)
        
        return self.rgbColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: alpha)
    }
    
    
    private static func hexIntColor(hexInt : Int, alpha : CGFloat) -> UIColor {
        
        let r : CGFloat = ((CGFloat)((hexInt & 0xff0000) >> 16)) / 255.0
        let g : CGFloat = ((CGFloat)((hexInt & 0xff00) >> 8)) / 255.0
        let b : CGFloat = ((CGFloat)(hexInt & 0xff)) / 255.0
        
        return UIColor.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    
    static func hexColor<T: Equatable> (hex: T, alpha: CGFloat = 1.0) -> UIColor {
        
        if T.self == String.self {
            return self.hexStringColor(hex: hex as! String, alpha: alpha)
        } else {
            return self.hexIntColor(hexInt: hex as! Int, alpha: CGFloat(alpha))
        }
    }
    
}
