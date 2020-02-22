import SwiftAssert
import XCTest

class FailureReporterSpy: FailureReporter {
    private(set) var reportedFailures: [Failure] = []
    
    func reportFailure(_ failure: Failure) {
        reportedFailures.append(failure)
    }
}

class FailureReporterMock: FailureReporterSpy {
    func assertOneReportedFailure(
        withText text: String,
        at location: SourceLocation,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(reportedFailures.count, 1, "Number of reported failures", file: file, line: line)
        XCTAssertEqual(reportedFailures[0].text, text, "Text", file: file, line: line)
        assertFailureLocation(reportedFailures[0].location, isEqualTo: location, file: file, line: line)
    }
    
    func assertReportedFailure(
        withText text: String,
        at location: SourceLocation,
        index: Int,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(reportedFailures[index].text, text, "Text", file: file, line: line)
        assertFailureLocation(reportedFailures[index].location, isEqualTo: location, file: file, line: line)
    }
    
    func assertNoReportedFailures(
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(reportedFailures.count, 0, "Number of reported failures", file: file, line: line)
    }
    
    func assertHasNumberOfReportedFailures(
        _ value: Int,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(reportedFailures.count, value, "Number of reported failures", file: file, line: line)
    }
}

func assertFailureLocation(
    _ location: SourceLocation,
    isEqualTo other: SourceLocation,
    file: StaticString = #file,
    line: UInt = #line
) {
    XCTAssertEqual("\(location.filePath)", "\(other.filePath)", "File path",file: file, line: line)
    XCTAssertEqual(location.line, other.line, "Line",file: file, line: line)
}
