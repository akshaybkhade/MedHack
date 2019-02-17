//
//  UINavigationExtension.swift
//  ExtensionClasses
//
//  Created by Shekhar on 4/14/17.
//  Copyright © 2017 perennial. All rights reserved.
//

import UIKit
import Foundation

private let NAVIGATION_ANIMATION_DURATION   =  0.25


extension UINavigationController {
   
    func popToRootViewControllerRetro() {
       
        self.popToRootViewController(animated: true)
    }
}
