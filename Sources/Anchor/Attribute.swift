
extension Anchor {

	public enum Attribute: Int, Codable {

		case left = 1
		case right
		case top
		case bottom
		case leading
		case trailing
		case width
		case height
		case centerX
		case centerY
		case lastBaseline
		case firstBaseline
		case leftMargin
		case rightMargin
		case topMargin
		case bottomMargin
		case leadingMargin
		case trailingMargin
		case centerXWithinMargins
		case centerYWithinMargins
		case notAnAttribute
	}
}

#if os(iOS) || os(tvOS)
import UIKit

extension Anchor.Attribute {

    internal var native: NSLayoutConstraint.Attribute? {
        return NSLayoutConstraint.Attribute(rawValue: self.rawValue)
    }
}

#elseif os(macOS)
import AppKit

extension Anchor.Attribute {

    internal var native: NSLayoutConstraint.Attribute? {
        return NSLayoutConstraint.Attribute(rawValue: self.rawValue)
    }
}

#endif
