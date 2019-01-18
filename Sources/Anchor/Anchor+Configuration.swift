
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
		multiplierValue = .let(value)
		return self
	}

	func multiplier(_ value: Int) -> Self {
		multiplierValue = .let(Double(value))
		return self
	}

    func multiplier(_ variable: Variable<Double>) -> Self {
        multiplierValue = variable
        return self
    }

	func priority(_ value: Float) -> Self {
		priorityValue = .let(value)
		return self
	}

    func priority(_ variable: Variable<Float>) -> Self {
        priorityValue = variable
        return self
    }
}
