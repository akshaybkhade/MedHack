

import Foundation
struct Medicine : Codable {
	let name : String?
	let form : String?
	let standardUnits : Int?
	let packageForm : String?
	let price : Double?
	let size : String?
	let manufacturer : String?
	let constituents : [Constituents]?
	let schedule : Schedule?
	let medicine_id : String?
    var isSelected = false
	enum CodingKeys: String, CodingKey {

		case name = "name"
		case form = "form"
		case standardUnits = "standardUnits"
		case packageForm = "packageForm"
		case price = "price"
		case size = "size"
		case manufacturer = "manufacturer"
		case constituents = "constituents"
		case schedule = "schedule"
		case medicine_id = "medicine_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
        
		form = try values.decodeIfPresent(String.self, forKey: .form)
		standardUnits = try values.decodeIfPresent(Int.self, forKey: .standardUnits)
		packageForm = try values.decodeIfPresent(String.self, forKey: .packageForm)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		size = try values.decodeIfPresent(String.self, forKey: .size)
		manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
		constituents = try values.decodeIfPresent([Constituents].self, forKey: .constituents)
		schedule = try values.decodeIfPresent(Schedule.self, forKey: .schedule)
        do{
		medicine_id = try values.decodeIfPresent(String.self, forKey: .medicine_id)
        }catch
        {
          let id   = try values.decodeIfPresent(Int.self, forKey: .medicine_id)
          medicine_id = "\(id!)"
        }
	}

    
}
