
import Foundation
struct Schedule : Codable {
	let category : String?
	let label : String?

	enum CodingKeys: String, CodingKey {

		case category = "category"
		case label = "label"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		category = try values.decodeIfPresent(String.self, forKey: .category)
		label = try values.decodeIfPresent(String.self, forKey: .label)
	}
}
