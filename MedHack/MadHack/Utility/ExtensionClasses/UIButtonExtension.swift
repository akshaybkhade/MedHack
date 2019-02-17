//
//  UIButtonExtension.swift
//  ExtensionClasses
//
//  Created by Shekhar on 4/14/17.
//  Copyright © 2017 perennial. All rights reserved.
//

import UIKit
import Foundation

extension UIButton {
    
   
    private func imageWithColor(color: UIColor) -> UIImage {

        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func setBackgroundImage(color: UIColor?, forUIControlState state: UIControl.State) {

        if(color != nil){
            self.setBackgroundImage(imageWithColor(color: color!), for: state)
        }
    }
    
}
