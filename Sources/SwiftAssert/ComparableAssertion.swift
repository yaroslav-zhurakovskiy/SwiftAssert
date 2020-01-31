public extension Assertion where Subject: Comparable {
    @discardableResult
    func isLessThan(_ other: Subject, file: StaticString = #file, line: UInt = #line) -> Self {
        if !(subject < other) {
            let failure = Failure(
                text: "Expected \(subject) to be less than \(other)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        
        return self
    }
    
    @discardableResult
    func isLessThanOrEqualTo(_ other: Subject, file: StaticString = #file, line: UInt = #line) -> Self {
        if !(subject <= other) {
            let failure = Failure(
                text: "Expected \(subject) to be less than or equal to \(other)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func isGreaterThan(_ other: Subject, file: StaticString = #file, line: UInt = #line) -> Self {
        if !(subject > other) {
            let failure = Failure(
                text: "Expected \(subject) to be greater than \(other)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }

    @discardableResult
    func isGreaterThanOrEqualTo(_ other: Subject, file: StaticString = #file, line: UInt = #line) -> Self {
        if !(subject >= other) {
            let failure = Failure(
                text: "Expected \(subject) to be greater than or equal to \(other)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func isInRange(
        _ range: Range<Subject>,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if !range.contains(subject) {
            let failure = Failure(
                text: "Expected \(subject) to be in range: \(range)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func isInRange(
        _ range: ClosedRange<Subject>,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if !range.contains(subject) {
            let failure = Failure(
                text: "Expected \(subject) to be in range: \(range)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}
