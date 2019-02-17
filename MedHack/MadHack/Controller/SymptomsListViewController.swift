//
//  SymptomsListViewController.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit
import SwiftSpinner

class SymptomsListViewController: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnCOntinue: UIButton!
    var allsymptoms : [Disease] = [Disease]()
    var symptoms : [Disease] = [Disease]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //  btnCOntinue.isHidden = true
        self.txtSearch.delegate = self
        getSymptoms()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self // This is not required
        self.view.addGestureRecognizer(tap)
        btnCOntinue.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
       self.navigationItem.title = "Symptoms ";

    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.txtSearch.resignFirstResponder()
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        
        if(txtSearch.text == nil || txtSearch.text!.length()   < 3)
        {
            MWBanner.sharedInstance().showErrorMessage("Please enter at least 3 letters")
        }else{
            let filtered = allsymptoms.filter { $0.disease_info!.contains(self.txtSearch.text!) }
            symptoms = filtered
            if(filtered.count == 0)
            {
                MWBanner.sharedInstance().showErrorMessage("No Disease found for \(txtSearch.text!) symptom")
            }else{
               self.showReusltsScreeen(results: symptoms)
            }
        }
    }
    
    func getSymptoms()
    {
        SwiftSpinner.show("Loading....")
        let networkService = MedNetworkService()
        networkService.performGetDisease { (disesModel, error) in
            SwiftSpinner.hide()
            if(error.length() > 0)
            {
                MWBanner.sharedInstance().showErrorMessage(error)
                
            }else{
                self.symptoms = disesModel
                self.allsymptoms = disesModel
                //self.tableView.reloadData()
            }
        }
    }
    
    func showReusltsScreeen(results : [Disease])
    {
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let result  = mainStoryboard.instantiateViewController(withIdentifier: "SymptomdResultViewController") as! SymptomdResultViewController
        result.results = results
        self.navigationController?.pushViewController(result, animated: true)
    }
    
    @IBAction func textFieldValueChange(_ sender: Any) {
        
        let filtered = allsymptoms.filter { $0.disease_name!.contains(self.txtSearch.text!) }
        symptoms = filtered
        if(filtered.count == 0)
        {
           symptoms = allsymptoms
        }
    }
}
