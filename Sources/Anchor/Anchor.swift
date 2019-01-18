
import Tag
import Variable

public final class Anchor: Codable, Taggable {

	public var subject: Subject

	var pins: [Pin] = []
    var multiplierValue: Variable<Double> = .let(1)
	var priorityValue: Variable<Float>?
	var relationValue: Relation = .equal
	public var toValue: To = .none
    public var tags: [Tag] = []

	public init(_ subject: Subject) {
		self.subject = subject
	}
}
