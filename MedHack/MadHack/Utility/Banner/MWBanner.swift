//
//  MWBanner.swift
//  MyWallet
//
//  Created by Perennial on 10/11/17.
//  Copyright © 2017 com.perennial. All rights reserved.
//

import UIKit

let APP:UIWindow = UIApplication.shared.delegate!.window!!
let CLOSE_PUSH_SEC     : TimeInterval = 3
let SHOW_ANIM_DUR                     = 0.5
let HIDE_ANIM_DUR                     = 0.35
let BANNER_VIEW_HEIGHT : CGFloat      = 42
let CORNER_RADIUS      : CGFloat      = 2.0
let FONT               : UIFont       = UIFont.systemFont(ofSize: 14)
let Y_POS              : CGFloat      =   85
let Y_POS_NO_NW        : CGFloat      =   85 


class MWBanner: UIView {
    
    @IBOutlet weak var stackView    : UIStackView!
    @IBOutlet weak var messageLabel : UILabel!
    
    var onClickBlock : (() -> Void)?
    var closeTimer: Timer?
    var currentMessage : String?
    var messageTap : UITapGestureRecognizer?
    
    //Singleton instance
    
    static var sharedMWBanner :  MWBanner!
    static var noNetworksharedMWBanner :  MWBanner!
    
    
    //MARK:- Initialize shared instance
    
    class func sharedInstance() -> MWBanner {
        
        if (sharedMWBanner == nil) {
            
            sharedMWBanner = UINib(nibName: "MWBanner", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? MWBanner
            sharedMWBanner?.setUpUI()
        }
        return sharedMWBanner!
    }
    
    class func noNetworkBanner() -> MWBanner {
        if noNetworksharedMWBanner == nil{
            noNetworksharedMWBanner = UINib(nibName: "MWBanner", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? MWBanner
            noNetworksharedMWBanner?.setUpUI()
        }
        return noNetworksharedMWBanner!
        
    }
    
    func bringToTop(){
        APP.bringSubviewToFront(self)
    }
    
    //MARK:- Lifecycle (of sort)
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        let f = self.frame
        let width = UIApplication.shared.keyWindow?.bounds.width
        self.frame = CGRect(x: f.minX, y: Y_POS , width: width!, height: f.height)
        self.alpha = 0;
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func setUpUI() {
        
        APP.addSubview(self)
    }
    
    func showNotificationWithMessage(message: String, clickClosure: (() -> Void)?) {
        
        self.onClickBlock = clickClosure
    }
    
    func showErrorMessage(_ message: String) {
        if(message != ""){
            self.backgroundColor =  UIColor(red:0.84, green:0.09, blue:0.16, alpha:0.7)
            
            self.showNotificationWithMessage(message)
            
            if((self.closeTimer) != nil) {
                
                self.closeTimer?.invalidate()
                self.closeTimer = nil
            }
            
            self.closeTimer = Timer.scheduledTimer(timeInterval: CLOSE_PUSH_SEC, target: self, selector: #selector(MWBanner.close), userInfo: nil, repeats: false)
        }
    }
    
    
    func showSuccessMessage(_ message: String) {
        
        self.backgroundColor =  UIColor(red:0.11, green:0.69, blue:0.37, alpha:0.7)
        self.showNotificationWithMessage(message)
        
        if((self.closeTimer) != nil) {
            
            self.closeTimer?.invalidate()
            self.closeTimer = nil
        }
        
        self.closeTimer = Timer.scheduledTimer(timeInterval: CLOSE_PUSH_SEC, target: self, selector: #selector(MWBanner.close), userInfo: nil, repeats: false)
    }
    
    func showNotificationWithMessage(_ message: String) {
        
        self.currentMessage = message
        self.removeTapGesture()
        self.perform(#selector(addTapGesture), with: nil, afterDelay: 1.0)
        
        let messageString = NSString(string: message)
        let tempSize = CGSize(width: 215, height: CGFloat(Float.greatestFiniteMagnitude))
        
        let newMessageSize = messageString.boundingRect(with: tempSize, options: [.truncatesLastVisibleLine, .usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: FONT], context: nil).size
        
        var frame = self.frame
        self.frame = CGRect(x: frame.minX, y: frame.minY, width: Constant.SCREEN_WIDTH, height: max(newMessageSize.height, BANNER_VIEW_HEIGHT))
        
        self.messageLabel.text = message
        APP.windowLevel = UIWindow.Level.normal
        
        frame = self.frame
        self.frame = CGRect(x: frame.minX, y: Y_POS, width: frame.width, height: frame.height)
        APP.addSubview(self)
        self.alpha = 0;
        //Show
        UIView.animate(withDuration: SHOW_ANIM_DUR, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            
            self.alpha = 1;
        }, completion: { (completed) in
            
        })
        
    }
    
    
    func showNoNetworkMessage(_ message: String) {
        
        self.backgroundColor =  UIColor(red:0.84, green:0.09, blue:0.16, alpha:0.7)
        let messageString = NSString(string: message)
        let tempSize = CGSize(width: 215, height: CGFloat(Float.greatestFiniteMagnitude))
        
        let newMessageSize = messageString.boundingRect(with: tempSize, options: [.truncatesLastVisibleLine, .usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: FONT], context: nil).size
        
        var frame = self.frame
        self.frame = CGRect(x: frame.minX, y: frame.minY, width: Constant.SCREEN_WIDTH, height: max(newMessageSize.height, BANNER_VIEW_HEIGHT))
        
        self.messageLabel.text = message
        APP.windowLevel = UIWindow.Level.normal
        
        frame = self.frame
        self.frame = CGRect(x: frame.minX, y: Y_POS_NO_NW, width: frame.width, height: frame.height)
        APP.addSubview(self)
        self.alpha = 0;
        //Show
        UIView.animate(withDuration: SHOW_ANIM_DUR, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            
            self.alpha = 1;
        }, completion: { (completed) in
            
        })
        
    }
    
    
    func closeWithCompletion(completion: (() -> Void)?) {
        
        self.closeTimer?.invalidate()
        self.closeTimer = nil
        
        UIView.animate(withDuration: HIDE_ANIM_DUR, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            
            self.alpha = 0;
        }) { (completed) in
            
            if(completion != nil) {
                completion!()
            }
        }
        
    }
    
    @objc func close() {
        
        self.removeTapGesture()
        self.closeWithCompletion(completion: nil)
        self.onClickBlock = nil
    }
    
    //MARK:- Actions
    
    @objc func messageTapAction() {
        
        if(self.onClickBlock != nil) {
            
            self.onClickBlock!()
        }
        self.close()
    }
    
    func removeTapGesture() {
        
        if(self.messageTap != nil) {
            
            self.stackView.removeGestureRecognizer(self.messageTap!)
            self.messageTap = nil
        }
    }
    
    @objc func addTapGesture() {
        
        self.messageTap = UITapGestureRecognizer(target: self, action: #selector(messageTapAction))
        self.stackView.addGestureRecognizer(self.messageTap!)
    }
    
}

