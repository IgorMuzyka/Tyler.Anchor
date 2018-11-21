
import Identifier 

extension Anchor {

    public enum Subject {

		case `self`
		case `super`
		case id(Identifier)
	}
}

extension Anchor.Subject: Codable {

	public enum AnchorSubjectCodingError: Error {
		case decoding(String)
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.singleValueContainer()

		if let value = try? values.decode(Identifier.self) {
			self = .id(value)
		} else if let value = try? values.decode(Bool.self) {
			self = value ? .`self` : .super
		} else {
			throw AnchorSubjectCodingError.decoding("\(dump(values))")
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()

		switch self {
		case .id(let id): try container.encode(id)
		case .`self`: try container.encode(true)
		case .super: try container.encode(false)
		}
	}
}
