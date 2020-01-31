import XCTest
import SwiftAssert

class ComparableAssertion_IsInRange_TestCase: AssertionTestCase {
    private let five = ComparableValue(5)
    
    func test_WhenInRange_ShouldNotReportFailure() {
        assertThat(five).isInRange(ComparableValue(4)..<ComparableValue(6))
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenIsOutsideOfBounds_ShouldReportFailure() {
        let zero = ComparableValue(0)
        let location = createFailureLocationInThisFileAtTheNextLine()
        assertThat(five).isInRange(zero..<five)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(five) to be in range: \(zero)..<\(five)",
            at: location
        )
    }
}
