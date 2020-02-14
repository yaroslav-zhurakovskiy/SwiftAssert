import SwiftAssert
import XCTest

class XCTObserverFailureReporterTestCase: XCTestCase {
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
    
    func __testShouldRecordTwoFailures() {
        let reporter: FailureReporter = XCTObserverFailureReporter()
        let failure1 = Failure(text: "Failure 1", location: SourceLocation(filePath: #file, line: #line))
        let failure2 = Failure(text: "Failure 2", location: SourceLocation(filePath: #file, line: #line))
        reporter.reportFailure(failure1)
        reporter.reportFailure(failure2)
        
        XCTAssertEqual(recordedFailures.count, 1, "Number of reported failures")
        assertRecoredFailure(recordedFailures[0], matchesFailure: failure1)
        assertRecoredFailure(recordedFailures[1], matchesFailure: failure2)
    }
    
    private func assertRecoredFailure(
        _ record: RecordedFailure,
        matchesFailure failure: Failure,
        line: UInt = #line
    ) {
        XCTAssertEqual(record.description, failure.text, "Failure text", line: line)
        XCTAssertEqual(record.file, "\(failure.location.filePath)", "Failure file path", line: line)
        XCTAssertEqual(record.line, Int(failure.location.line), "Failure line number", line: line)
    }
    
    override func recordFailure(withDescription description: String, inFile filePath: String, atLine lineNumber: Int, expected: Bool) {
        if description.starts(with: "XCT") {
            super.recordFailure(withDescription: description, inFile: filePath, atLine: lineNumber, expected: expected)
        } else {
            recordedFailures.append(RecordedFailure(
                description: description,
                file: filePath,
                line: lineNumber
            ))
        }
        
    }
}
