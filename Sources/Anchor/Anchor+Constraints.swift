
#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

import Tag
import Variable

#if os(iOS) || os(tvOS)
fileprivate typealias LayoutPriority = UILayoutPriority
#elseif os(macOS)
fileprivate typealias LayoutPriority = NSLayoutConstraint.Priority
#endif

#if os(iOS) || os(tvOS) || os(macOS)

extension Anchor {

    public func constraints(context: ContextProtocol, pair: VariableResolutionPair) throws -> [NativeConstraint] {
		switch toValue {
        case .anchor(let anchor): return try output(anchor: anchor, context: context, pair: pair)
		case .size: return try outputForSize(context: context, pair: pair)
		case .none:
            guard let _ = context.super else { return [] }

            toValue = .anchor(Anchor(.super))

            return try constraints(context: context, pair: pair)
		}
	}

	private func outputForSize(context: ContextProtocol, pair: VariableResolutionPair) throws -> [NativeConstraint] {
		return try pins.filter {
			return $0.attribute == .width || $0.attribute == .height
		}.compactMap { pin in
			guard
				let attribute = pin.attribute.native,
				let relation = relationValue.native
				else { return nil }

            let multiplier = try self.multiplierValue.resolve(pair)!
            let constant = try pin.constant.resolve(pair)!

			let constraint = NativeConstraint(
				item: context.view,
				attribute: attribute,
				relatedBy: relation,
				toItem: nil,
				attribute: .notAnAttribute,
				multiplier: CGFloat(multiplier),
				constant: CGFloat(constant)
			)

            if
                let priorityVariable = self.priorityValue,
                let priority = try priorityVariable.resolve(pair)
            {
                constraint.priority = LayoutPriority(rawValue: priority)
            }

            constraint.identifier = tagNames

            return constraint
		}
	}

	private func output(anchor anotherAnchor: Anchor, context: ContextProtocol, pair: VariableResolutionPair) throws -> [NativeConstraint] {
		let anotherPins = anotherAnchor.pins.isEmpty ? pins : anotherAnchor.pins
		let pairs = zip(pins, anotherPins)

		guard
			let item = item(in: context),
			let anotherItem = anotherAnchor.item(in: context)
			else { return [] }

		return try pairs.compactMap { pin, anotherPin in
			guard
				let attribute = pin.attribute.native,
				let relation = relationValue.native,
				let anotherAttribute = anotherPin.attribute.native
				else { return nil }

            let multiplier = try self.multiplierValue.resolve(pair)!
            let constant = try pin.constant.resolve(pair)!

			let constraint = NativeConstraint(
				item: item,
				attribute: attribute,
				relatedBy: relation,
				toItem: anotherItem,
				attribute: anotherAttribute,
				multiplier: CGFloat(multiplier),
				constant: CGFloat(constant)
			)

            if
                let priorityVariable = self.priorityValue,
                let priority = try priorityVariable.resolve(pair)
            {
                constraint.priority = LayoutPriority(rawValue: priority)
            }

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
