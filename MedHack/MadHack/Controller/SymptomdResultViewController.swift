//
//  SymptomdResultViewController.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit

class SymptomdResultViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var results : [Disease] = [Disease]()
    
    @IBOutlet weak var btnHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      //  self.navigationController?.navigationBar.isHidden = true
        btnHome.setBorderWithColor(borderColor: UIColor.rgbColor(red: 64,green: 127,blue: 76,alpha: 1));
       self.navigationItem.title  = "Symptoms ";

    }
    
    @IBAction func homeButtonAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomsTableViewCell", for: indexPath) as! SymptomsTableViewCell
        cell.configCell(disease: results[indexPath.row])
        return cell
    }
}
