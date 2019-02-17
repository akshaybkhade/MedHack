//
//  SymptomModel.swift
//  MadHack
//
//  Created by Pravin Jadhao on 16/02/19.
//  Copyright © 2019 Pravin Jadhao. All rights reserved.
//

import UIKit

class SymptomModel: Codable {

    var id  : String?
    var name : String?
    var isSelected : Bool? = false;
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        isSelected = false;
    }

}
