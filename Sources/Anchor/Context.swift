
import Identifier

public protocol Context: class {

    var view: NativeView { get }
    var `super`: Context? { get }
    var root: Context { get }
    var id: Identifier { get }

    func find(where predicate: (Context) -> Bool) -> Context?
    func find(byName name: String) -> Context?
}
