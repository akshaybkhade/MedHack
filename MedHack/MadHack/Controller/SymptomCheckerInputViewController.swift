//
//  SymptomCheckerInputViewController.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit

class SymptomCheckerInputViewController: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate {

    @IBOutlet weak var txtAge: UITextField!
    
    @IBOutlet weak var btmMale: UIButton!
    
    @IBOutlet weak var btnFemale: UIButton!
    
    @IBOutlet weak var btncontinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btmMale.setCorner(5)
        btnFemale.setCorner(5)
        btncontinue.setCorner(5)
        btmMale.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
        btnFemale.setBorderWithColor(borderColor: UIColor.gray);
        btncontinue.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
        txtAge.delegate = self;
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self // This is not required
        self.view.addGestureRecognizer(tap)
        self.navigationItem.title  = "Symptoms ";

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false;
    }
 
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.txtAge.resignFirstResponder()
    }
    
    @IBAction func maleAction(_ sender: Any) {
        btmMale.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
        btnFemale.setBorderWithColor(borderColor: UIColor.gray);
    }
    @IBAction func femaleAction(_ sender: Any) {
        btnFemale.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
        btmMale.setBorderWithColor(borderColor: UIColor.gray);
    }
    @IBAction func continueAction(_ sender: Any) {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let authorisationViewController  = mainStoryboard.instantiateViewController(withIdentifier: "SymptomsListViewController") as! SymptomsListViewController
        self.navigationController?.pushViewController(authorisationViewController, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.txtAge.resignFirstResponder()
    }
}
