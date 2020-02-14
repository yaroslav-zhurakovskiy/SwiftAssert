import Example
import SwiftAssert
import XCTest

class XCTestFailureReporterTests: XCTestCase {
    override func setUp() {
        FailureReporterHolder.sharedReporter = XCTestFailureReporter(testCase: self)
    }
    
    func test() {
        assertThat(Example.add(x: 2, y: 2)).isEqualTo(5)
    }
}

class XCTObserverFailureReporterTests: XCTestCase {
    override func setUp() {
        FailureReporterHolder.sharedReporter = XCTObserverFailureReporter()
    }
    
    func test() {
        assertThat(Example.add(x: 2, y: 2)).isEqualTo(5)
    }
}
