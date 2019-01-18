
import Tag
import Variable

public final class Anchor: Codable, Taggable {

	public var subject: Subject

	var pins: [Pin] = []
	var multiplier: Variable<Double> = .let(1)
	var priority: Variable<Float>?
	var relation: Relation = .equal
	public var to: To = .none
    public var tags: [Tag] = []

	public init(_ subject: Subject) {
		self.subject = subject
	}
}
