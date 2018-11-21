
import Identifier

public protocol ContextProtocol: class {

    var view: NativeView { get }
    var `super`: ContextProtocol? { get }
    var root: ContextProtocol { get }
    var id: Identifier { get }

    func find(where predicate: (ContextProtocol) -> Bool) -> ContextProtocol?
    func find(byName name: String) -> ContextProtocol?
}
