public protocol Assertion {
    associatedtype Subject
    
    init(subject: Subject)
    
    var subject: Subject { get }
}
