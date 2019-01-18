
import Variable

public extension Anchor {

	func constant(_ value: Double) -> Self {
		pins.forEach {
			$0.constant = .let(value)
		}

		return self
	}

    func constant(_ variable: Variable<Double>) -> Self {
        pins.forEach {
            $0.constant = variable
        }
        return self
    }

	func multiplier(_ value: Double) -> Self {
		multiplier = .let(value)
		return self
	}

	func multiplier(_ value: Int) -> Self {
		multiplier = .let(Double(value))
		return self
	}

    func multiplier(_ variable: Variable<Double>) -> Self {
        multiplier = variable
        return self
    }

	func priority(_ value: Float) -> Self {
		priority = .let(value)
		return self
	}

    func priority(_ variable: Variable<Float>) -> Self {
        priority = variable
        return self
    }
}
