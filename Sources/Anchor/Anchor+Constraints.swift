
#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

import Tag

#if os(iOS) || os(tvOS) || os(macOS)

extension Anchor {

	public func constraints(context: ContextProtocol) -> [NativeConstraint] {
		switch toValue {
		case .anchor(let anchor): return output(anchor: anchor, context: context)
		case .size: return outputForSize(context: context)
		case .none:
            guard let _ = context.super else { return [] }

            toValue = .anchor(Anchor(.super))

            return constraints(context: context)
		}
	}

	private func outputForSize(context: ContextProtocol) -> [NativeConstraint] {
		return pins.filter {
			return $0.attribute == .width || $0.attribute == .height
		}.compactMap { pin in
			guard
				let attribute = pin.attribute.native,
				let relation = relationValue.native
				else { return nil }

			let constraint = NativeConstraint(
				item: context.view,
				attribute: attribute,
				relatedBy: relation,
				toItem: nil,
				attribute: .notAnAttribute,
				multiplier: CGFloat(multiplierValue),
				constant: CGFloat(pin.constant)
			)

            constraint.identifier = tagNames

            return constraint
		}
	}

	private func output(anchor anotherAnchor: Anchor, context: ContextProtocol) -> [NativeConstraint] {
		let anotherPins = anotherAnchor.pins.isEmpty ? pins : anotherAnchor.pins
		let pairs = zip(pins, anotherPins)

		guard
			let item = item(in: context),
			let anotherItem = anotherAnchor.item(in: context)
			else { return [] }

		return pairs.compactMap { pin, anotherPin in
			guard
				let attribute = pin.attribute.native,
				let relation = relationValue.native,
				let anotherAttribute = anotherPin.attribute.native
				else { return nil }

			let constraint = NativeConstraint(
				item: item,
				attribute: attribute,
				relatedBy: relation,
				toItem: anotherItem,
				attribute: anotherAttribute,
				multiplier: CGFloat(multiplierValue),
				constant: CGFloat(pin.constant)
			)

            constraint.identifier = tagNames

            return constraint
		}
	}

	private func item(in context: ContextProtocol) -> NativeView? {
		switch subject {
		case .id(let id): return context.root.find(where: { $0.id == id})?.view
		case .`self`: return context.view
		case .`super`: return context.super?.view
		}
	}
}

#endif
