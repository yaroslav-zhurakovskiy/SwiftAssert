public extension Assertion where Subject: Hashable {
    @discardableResult
    func hasHashValue(_ hashValue: Int, sourceLocation: Failure.Location = .init()) -> Self {
        if subject.hashValue != hashValue {
            let failure = Failure(
                text: """
                Expected hash value of \(subject) to be:
                    \(hashValue)
                but was:
                    \(subject.hashValue)
                """,
                location: sourceLocation
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}
