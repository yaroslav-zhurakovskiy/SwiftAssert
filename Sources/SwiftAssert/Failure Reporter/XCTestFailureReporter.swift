import XCTest

public class XCTestFailureReporter: FailureReporter {
    private let testCase: XCTestCase?
    
    public init(testCase: XCTestCase?) {
        self.testCase = testCase
    }
    
    public func reportFailure(_ failure: Failure) {
        testCase?.recordFailure(
            withDescription: failure.text,
            inFile: "\(failure.location.fileName)",
            atLine: Int(failure.location.line),
            expected: true
        )
    }
}
