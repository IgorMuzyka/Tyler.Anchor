
extension Anchor {

    public struct EdgeInsets: Codable {

        public var top: Double
        public var left: Double
        public var bottom: Double
        public var right: Double

        public init(top: Double, left: Double, bottom: Double, right: Double) {
            self.top = top
            self.left = left
            self.bottom = bottom
            self.right = right
        }
    }
}

extension Anchor.EdgeInsets {

	public static var zero: Anchor.EdgeInsets {
		return Anchor.EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}

#if os(iOS) || os(tvOS)
import UIKit

extension Anchor.EdgeInsets {

    internal var native: UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right))
    }
}

#elseif os(macOS)
import AppKit

extension Anchor.EdgeInsets {

    internal var native: NSEdgeInsets {
        return NSEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right))
    }
}

#endif
