
extension Anchor {

    public enum To {

		case anchor(Anchor)
		case size
		case none
	}
}

extension Anchor.To: Codable {

	public enum AnchorToCodingError: Error {
		case decoding(String)
	}

	public init(from decoder: Decoder) throws {
		let values = try decoder.singleValueContainer()

		if let value = try? values.decode(Anchor.self) {
			self = .anchor(value)
		} else if let value = try? values.decode(Bool.self) {
			self = value ? .size : .none
		} else {
			throw AnchorToCodingError.decoding("\(dump(values))")
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()

		switch self {
		case .anchor(let anchor): try container.encode(anchor)
		case .size: try container.encode(true)
		case .none: try container.encode(false)
		}
	}
}
