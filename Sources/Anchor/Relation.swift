
extension Anchor {

	public enum Relation: Int, Codable, Equatable {

		case lessThanOrEqual = -1
		case equal = 0
		case greaterThanOrEqual = 1
	}
}

#if os(iOS) || os(tvOS)
import UIKit

extension Anchor.Relation {

    internal var native: NSLayoutConstraint.Relation? {
        return NSLayoutConstraint.Relation(rawValue: self.rawValue)
    }
}

#elseif os(macOS)
import AppKit

extension Anchor.Relation {

    internal var native: NSLayoutConstraint.Relation? {
        return NSLayoutConstraint.Relation(rawValue: self.rawValue)
    }
}

#endif
