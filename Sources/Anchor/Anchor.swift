
import Tag

public final class Anchor: Codable, Taggable {

	public var subject: Subject

	var pins: [Pin] = []
	var multiplierValue: Double = 1
	var priorityValue: Float?
	var relationValue: Relation = .equal
	public var toValue: To = .none
    public var tags: [Tag] = []

	public init(_ subject: Subject) {
		self.subject = subject
	}
}
