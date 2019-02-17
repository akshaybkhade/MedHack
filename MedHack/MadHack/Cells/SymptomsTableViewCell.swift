//
//  SymptomsTableViewCell.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit

class SymptomsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel?
    @IBOutlet weak var clickImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(disease : Disease) {
        
        self.lblTitle.text = disease.disease_name
       // self.clickImage.isHidden = disease.isSelected ?? false
    }

}
