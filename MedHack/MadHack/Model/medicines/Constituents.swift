
import Foundation
struct Constituents : Codable {
	let name : String?
	let strength : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case strength = "strength"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		strength = try values.decodeIfPresent(String.self, forKey: .strength)
	}
}
