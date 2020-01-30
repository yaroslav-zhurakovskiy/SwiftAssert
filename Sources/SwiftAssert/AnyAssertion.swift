public class AnyAssertion<Subject>: Assertion {
    public typealias Subject = Subject
    
    public let subject: Subject
    
    
    public required init(subject: Subject) {
        self.subject = subject
    }
}

public func assertThat<Subject>(_ subject: Subject) -> AnyAssertion<Subject> {
    return AnyAssertion(subject: subject)
}
