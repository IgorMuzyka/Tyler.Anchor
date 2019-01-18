
import Variable

extension Anchor {

    public final class Pin: Codable {

		let attribute: Attribute
		var constant: Variable<Double>

		init(_ attribute: Attribute, constant: Variable<Double> = .let(0)) {
			self.attribute = attribute
			self.constant = constant
		}
	}
}
