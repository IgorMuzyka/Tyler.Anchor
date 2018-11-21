
public extension Anchor {

	func constant(_ value: Double) -> Self {
		pins.forEach {
			$0.constant = value
		}

		return self
	}

	func multiplier(_ value: Double) -> Self {
		multiplierValue = value
		return self
	}

	func multiplier(_ value: Int) -> Self {
		multiplierValue = Double(value)
		return self
	}

	func priority(_ value: Float) -> Self {
		priorityValue = value
		return self
	}
}
