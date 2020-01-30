import SwiftAssert
import XCTest

class AssertionTestCase: XCTestCase {
    private static var originalReporter: FailureReporter!
    
    override class func setUp() {
        originalReporter = FailureReporterHolder.sharedReporter
    }
    
    override class func tearDown() {
        FailureReporterHolder.sharedReporter = originalReporter
    }
    
    var reporterMock: FailureReporterMock!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        reporterMock = FailureReporterMock()
        FailureReporterHolder.sharedReporter = reporterMock
    }
}
