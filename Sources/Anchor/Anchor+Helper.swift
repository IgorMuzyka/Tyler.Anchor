
import Variable

internal extension Anchor {

	func updateIfAny(_ attribute: Attribute, _ constant: Double) {
		let pin = pins.filter({ $0.attribute == attribute }).first
		pin?.constant = .let(constant)
	}

    func updateIfAny(_ attribute: Attribute, _ variable: Variable<Double>) {
        let pin = pins.filter({ $0.attribute == attribute}).first
        pin?.constant = variable
    }

	func removeIfAny(_ attribute: Attribute) {
		if let index = pins.index(where: { $0.attribute == attribute }) {
			pins.remove(at: index)
		}
	}
}
