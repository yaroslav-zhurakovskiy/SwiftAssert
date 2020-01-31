public class OptionalAssertion<Wrapped>: AnyAssertion<Optional<Wrapped>> {
    
}

public extension OptionalAssertion {
    func isNil(file: StaticString = #file, line: UInt = #line) {
        if let unwrapped = subject {
            let failure = Failure(
                text: "Expected nil but was: \(unwrapped)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
    }
    
    func isNotNil(file: StaticString = #file, line: UInt = #line) {
        if subject == nil {
            let failure = Failure(
                text: "Expected value not to be nil",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
    }
}

public extension OptionalAssertion {
    func isNotNilAnd(
        file: StaticString = #file,
        line: UInt = #line,
        _ spec: (AnyAssertion<Wrapped>) -> Void
    ) {
        if let wrapped = subject {
            spec(AnyAssertion(subject: wrapped))
        } else {
            return isNotNil(file: file, line: line)
        }
    }
}

public func assertThat<Wrapped>(_ subject: Optional<Wrapped>) -> OptionalAssertion<Wrapped> {
    return OptionalAssertion(subject: subject)
}
