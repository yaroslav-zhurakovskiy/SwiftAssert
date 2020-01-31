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
        at location: Failure.Location,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(reportedFailures.count, 1, "Number of reported failures", file: file, line: line)
        XCTAssertEqual(reportedFailures[0].text, text, "Text", file: file, line: line)
        assertFailureLocation(reportedFailures[0].location, isEqualTo: location, file: file, line: line)
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
    _ location: Failure.Location,
    isEqualTo other: Failure.Location,
    file: StaticString = #file,
    line: UInt = #line
) {
    XCTAssertEqual("\(location.fileName)", "\(location.fileName)", "File name",file: file, line: line)
    XCTAssertEqual(location.line, location.line, "Line",file: file, line: line)
}
