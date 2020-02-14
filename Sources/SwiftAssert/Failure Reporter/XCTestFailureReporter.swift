import XCTest

public class XCTestFailureReporter: FailureReporter {
    private let testCase: XCTestCase?
    
    public init(testCase: XCTestCase?) {
        self.testCase = testCase
    }
    
    public func reportFailure(_ failure: Failure) {
        testCase?.recordFailure(
            withDescription: failure.text,
            inFile: "\(failure.location.filePath)",
            atLine: Int(failure.location.line),
            expected: true
        )
    }
}

// Test for parallel execution. It might contain bugs
public class XCTObserverFailureReporter: NSObject, FailureReporter {
    private let center: XCTestObservationCenter
    
    private var reportPool: [Failure]
    
    public init(center: XCTestObservationCenter = .shared) {
        self.center = center
        self.reportPool = []
        
        super.init()
        
        self.center.addTestObserver(self)
    }
    
    deinit {
        self.center.removeTestObserver(self)
    }
    
    public func reportFailure(_ failure: Failure) {
        reportPool.append(failure)
    }
}


extension XCTObserverFailureReporter: XCTestObservation {
    public func testCaseDidFinish(_ testCase: XCTestCase) {
        for failure in reportPool {
            testCase.recordFailure(
                withDescription: failure.text,
                inFile: "\(failure.location.filePath)",
                atLine: Int(failure.location.line),
                expected: true
            )
        }
        
        reportPool.removeAll()
        
//        while let failure = nextFaiureFromReportPool() {
//            testCase.recordFailure(
//                withDescription: failure.text,
//                inFile: "\(failure.location.filePath)",
//                atLine: Int(failure.location.line),
//                expected: true
//            )
//        }
    }
    
    private func nextFaiureFromReportPool() -> Failure? {
        guard reportPool.count > 0 else {
            return nil
        }
        return reportPool.removeFirst()
    }
}
