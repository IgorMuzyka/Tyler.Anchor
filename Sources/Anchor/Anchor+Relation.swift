
public extension Anchor {

	var equal: Anchor {
		relation = .equal
		return self
	}

	var lessThanOrEqual: Anchor {
		relation = .lessThanOrEqual
		return self
	}

	var greaterThanOrEqual: Anchor {
		relation = .greaterThanOrEqual
		return self
	}
}
