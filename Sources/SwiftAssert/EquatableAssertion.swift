public extension Assertion where Subject: Equatable {
    @discardableResult
    func isEqualTo(_ other: Subject, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject != other {
            let failure = Failure(
                text: "Expected \(subject) to equal to \(other)",
                location: Failure.Location(fileName: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func isNotEqualTo(_ other: Subject, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject == other {
            let failure = Failure(
                text: "Expected \(subject) not to equal \(other)",
                location: Failure.Location(fileName: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}
