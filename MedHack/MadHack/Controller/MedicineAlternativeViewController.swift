//
//  MedicineAlternativeViewController.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit
import SwiftSpinner

class MedicineAlternativeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UITextFieldDelegate,UIGestureRecognizerDelegate{

    @IBOutlet weak var txtMedicineName: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var allMedicine = [Medicine]()
    var filterMedicine = [Medicine]()
    var selectedMedicine : Medicine?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = false
        tableView.delegate = self
        tableView.dataSource = self

       // let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
      //  tap.delegate = self  // This is not required
       // self.view.addGestureRecognizer(tap)
        getMedicine()
        self.navigationItem.title = "Medicine Alternative ";

    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.txtMedicineName.resignFirstResponder()
    }
    
    func getMedicine()
    {
        SwiftSpinner.show("Loading....")
        let networkService = MedNetworkService()
        networkService.performGetMedicin { (medicine, error) in
            SwiftSpinner.hide()
            if(error.length() > 0)
            {
                MWBanner.sharedInstance().showErrorMessage(error)
                
            }else{
                self.allMedicine = medicine
                self.filterMedicine = medicine
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func scanImage(_ sender: Any) {
        
    }
    
    @IBAction func textChange(_ sender: Any) {
        
        self.tableView.isHidden = false
        
        let filtered = allMedicine.filter { $0.name!.lowercased().contains(self.txtMedicineName.text!.lowercased()) }
        filterMedicine = filtered
        if(self.txtMedicineName.text?.length() == 0)
        {
            filterMedicine = allMedicine
        }
        self.tableView.reloadData()
    }
    
    @IBAction func getAlternativeMedicineAction(_ sender: Any) {
        
        if(selectedMedicine != nil)
        {
            SwiftSpinner.show("Loading....")
            let networkService = MedNetworkService()
            networkService.performGetAlternativeMedicin(id: selectedMedicine!.medicine_id!, completion: { (medicine, error) in
                SwiftSpinner.hide()
                if(error.length() > 0)
                {
                    MWBanner.sharedInstance().showErrorMessage(error)
                    
                }else{
                    if(medicine.count == 0)
                    {
                        MWBanner.sharedInstance().showErrorMessage("Sorry, Can't found any alternative medicine")
                        return
                    }
                    let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let alternative  = mainStoryboard.instantiateViewController(withIdentifier: "MedicineAlternativeResultViewController") as! MedicineAlternativeResultViewController
                    alternative.allMedicine = medicine
                    self.navigationController?.pushViewController(alternative, animated: true)
                }
            })
        }else{
            MWBanner.sharedInstance().showErrorMessage("Please select medicine")
        }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterMedicine.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomsTableViewCell", for: indexPath) as! SymptomsTableViewCell
        let medicin = filterMedicine[indexPath.row]
        cell.lblTitle.text = medicin.name
        cell.clickImage?.isHidden =  !medicin.isSelected
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selected = filterMedicine[indexPath.row].isSelected
     
        filterMedicine.forEach { (m) in
            var medicine = m as? Medicine
            medicine?.isSelected =  false
        }
        
        filterMedicine[indexPath.row].isSelected = !selected
        selectedMedicine = !selected ? filterMedicine[indexPath.row] : nil
        self.txtMedicineName.text = selectedMedicine?.name
        self.tableView.reloadData()
        self.tableView.isHidden = true
        self.txtMedicineName.resignFirstResponder()
    }
}
