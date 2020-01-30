import SwiftAssert
import XCTest

class XCTestFailureReporterTestCase: XCTestCase {
    struct RecordedFailure {
        let description: String
        let file: String
        let line: Int
    }
    private var recordedFailures: [RecordedFailure] = []
    
    override func setUp() {
        super.setUp()
        
        recordedFailures = []
    }
    
    func testShouldRecordOneFailure() {
        let reporter: FailureReporter = XCTestFailureReporter(testCase: self)
        let file: StaticString = #file
        let line: UInt = #line
        let failure = Failure(text: "Some text", location: Failure.Location(fileName: file, line: line))
        reporter.reportFailure(failure)
        
        XCTAssertEqual(recordedFailures.count, 1, "Number of reported failures")
        XCTAssertEqual(recordedFailures[0].description, failure.text, "Failure text")
        XCTAssertEqual(recordedFailures[0].file, "\(failure.location.fileName)", "Failure file path")
        XCTAssertEqual(recordedFailures[0].line, Int(failure.location.line), "Failure line number")
    }
    
    func testShouldBeTheDefaultReporter() {
        XCTAssertTrue(FailureReporterHolder.sharedReporter is XCTestFailureReporter, "FailureReporterHolder.sharedReporter is XCTestFailureReporter")
    }
    
    override func recordFailure(withDescription description: String, inFile filePath: String, atLine lineNumber: Int, expected: Bool) {
        recordedFailures.append(RecordedFailure(
            description: description,
            file: filePath,
            line: lineNumber
        ))
        
    }
}
