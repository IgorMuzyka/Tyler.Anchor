
public extension Anchor {

	func to(_ subject: Subject) -> Anchor {
		return to(Anchor(subject))
	}

	func to(_ anchor: Anchor) -> Anchor {
		toValue = .anchor(anchor)
		return self
	}

	func to(_ size: Double) -> Anchor {
		toValue = .size
		updateIfAny(.width, size)
		updateIfAny(.height, size)
		return self
	}
}
