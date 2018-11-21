
extension Anchor {

    public final class Pin: Codable {

		let attribute: Attribute
		var constant: Double

		init(_ attribute: Attribute, constant: Double = 0) {
			self.attribute = attribute
			self.constant = constant
		}
	}
}
