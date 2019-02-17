//
//  UIImageviewExtension.swift
//  MyWallet
//
//  Created by Pravin on 25/10/17.
//  Copyright © 2017 com.perennial. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire
extension UIImageView{
    
    func setImage(urlString : String?,placeholderImage: UIImage){
        guard let stringUrl = urlString, let url = URL(string: stringUrl) else {
            self.image =  placeholderImage
            return;
        }
        self.af_setImage(
            withURL: url,
            placeholderImage: placeholderImage,
            filter:nil,
            imageTransition: .noTransition//.crossDissolve(0.2)
        )
    }
    
    func setImage(urlString : String?){
        guard let stringUrl = urlString, let url = URL(string: stringUrl) else {
            return;
        }
        self.af_setImage(withURL: url)
    }

    func setImage(urlString : String?,placeholderImage: UIImage,completion: ((DataResponse<UIImage>) -> Void)? = nil) {
        guard let stringUrl = urlString, let url = URL(string: stringUrl) else {
            self.image =  placeholderImage
            return;
        }
        self.af_setImage(
            withURL: url,
            placeholderImage: placeholderImage,
            filter: nil, progress: nil,
            progressQueue: DispatchQueue.main,
            imageTransition: .noTransition,
            runImageTransitionIfCached: true,
            completion: completion
        )
    }
    
    func setImage(urlString : String?,indexPath : IndexPath,completion: ((_ indexPath : IndexPath) -> Void)? = nil) {
        guard let stringUrl = urlString, let url = URL(string: stringUrl) else {
            self.image =  nil
            return;
        }
        
        self.af_setImage(
            withURL: url,
            placeholderImage: nil,
            filter: nil, progress: nil,
            progressQueue: DispatchQueue.main,
            imageTransition: .noTransition,
            runImageTransitionIfCached: true) { (data) in
                completion?(indexPath)
        }
    }
  
}

