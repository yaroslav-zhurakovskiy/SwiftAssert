public extension Assertion where Subject: Hashable {
    @discardableResult
    func hasHashValue(
        _ hashValue: Int,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if subject.hashValue != hashValue {
            let failure = Failure(
                text: """
                Expected hash value of \(subject) to be:
                    \(hashValue)
                but was:
                    \(subject.hashValue)
                """,
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}
