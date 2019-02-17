

import Foundation
struct Disease : Codable {
	let disease_name : String?
	let disease_cat : String?
	let disease_info : String?
	let disease_id : String?
    var isSelected : Bool = false
	enum CodingKeys: String, CodingKey {

		case disease_name = "disease_name"
		case disease_cat = "disease_cat"
		case disease_info = "disease_info"
		case disease_id = "disease_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		disease_name = try values.decodeIfPresent(String.self, forKey: .disease_name)
		disease_cat = try values.decodeIfPresent(String.self, forKey: .disease_cat)
		disease_info = try values.decodeIfPresent(String.self, forKey: .disease_info)
		disease_id = try values.decodeIfPresent(String.self, forKey: .disease_id)
	}

}
