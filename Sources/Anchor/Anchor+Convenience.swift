
import Variable

public extension Anchor {

	var edges: Anchor {
		pins.removeAll()
		return top.right.bottom.left
	}

	var center: Anchor {
		return centerX.centerY
	}

	var size: Anchor {
		return width.height
	}

	func insets(_ insets: EdgeInsets) -> Anchor {
		updateIfAny(.top, insets.top)
		updateIfAny(.bottom, insets.bottom)
		updateIfAny(.left, insets.left)
		updateIfAny(.right, insets.right)
		return self
	}

	func insets(_ value: Double) -> Anchor {
		return insets(EdgeInsets(top: value, left: value, bottom: -value, right: -value))
	}

	func paddingHorizontally(_ value: Double) -> Anchor {
		removeIfAny(.leading)
		removeIfAny(.trailing)

		pins.append(Pin(.leading, constant: .let(value)))
		pins.append(Pin(.trailing, constant: .let(-value)))

		return self
	}
    #warning("implement variable accordingly (requires implementation for Double variable negation) ")

	func paddingVertically(_ value: Double) -> Anchor {
		removeIfAny(.top)
		removeIfAny(.bottom)

		pins.append(Pin(.top, constant: .let(value)))
		pins.append(Pin(.bottom, constant: .let(-value)))

		return self
	}
    #warning("implement variable accordingly (requires implementation for Double variable negation) ")
}
