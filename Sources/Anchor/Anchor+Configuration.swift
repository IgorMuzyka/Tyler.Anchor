
public extension Anchor {

	func constant(_ value: Double) -> Self {
		pins.forEach {
			$0.constant = value
		}

		return self
	}

	func multiplier(_ value: Double) -> Self {
		multiplier = value
		return self
	}

	func multiplier(_ value: Int) -> Self {
		multiplier = Double(value)
		return self
	}

	func priority(_ value: Float) -> Self {
		priority = value
		return self
	}
}
