public protocol Assertion {
    associatedtype Subject
    
    var subject: Subject { get }
}
