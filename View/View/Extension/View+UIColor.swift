//
//  UIColor_Extension.swift
//  View
//
//  Created by Giáp Trần on 9/20/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(hex: Int, alpha: CGFloat = 1) {
        let red = CGFloat((hex >> 16) & 0xff) / 255.0
        let green = CGFloat((hex >> 8) & 0xff) / 255.0
        let blue = CGFloat(hex & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public static var appTintColor: UIColor {
        return UIColor(hex: 0x9C27B0)
    }
    
}
