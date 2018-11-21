
internal extension Anchor {

	func updateIfAny(_ attribute: Attribute, _ constant: Double) {
		let pin = pins.filter({ $0.attribute == attribute }).first
		pin?.constant = constant
	}

	func removeIfAny(_ attribute: Attribute) {
		if let index = pins.index(where: { $0.attribute == attribute }) {
			pins.remove(at: index)
		}
	}
}
