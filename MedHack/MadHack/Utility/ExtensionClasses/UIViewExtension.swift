//
//  UIViewExtension.swift
//  ExtensionClasses
//
//  Created by Shekhar on 4/14/17.
//  Copyright © 2017 perennial. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func setBorderWithColor(borderColor : UIColor?){
        
        guard let color = borderColor else {
            return
        }
        let borderWidth:CGFloat = 1.0
        let cornerRadius:CGFloat = 3.0
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
   
    func setCorner(_ radius: CGFloat) {
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setRoundedCorners(radius: CGFloat, corners: UIRectCorner) {
        
        var maskPath = UIBezierPath()
        maskPath    = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners,cornerRadii: CGSize(width: radius,height: radius))
        let maskLayer                      = CAShapeLayer()
        maskLayer.path                     = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func addShadow(){
        addShadow(withHeight: 3)
    }

    func addShadow(withHeight : CGFloat,radius : CGFloat = 2){
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: withHeight)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 0.3
    }
}


