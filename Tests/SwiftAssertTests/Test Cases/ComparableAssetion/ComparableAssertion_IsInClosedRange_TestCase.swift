import XCTest
import SwiftAssert

class ComparableAssertion_IsInClosedRange_TestCase: AssertionTestCase {
    private let five = ComparableValue(5)
    
    func test_WhenInBounds_ShouldNotReportFailure() {
        assertThat(five).isInRange(ComparableValue(4)...ComparableValue(6))
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenIsOutsideOfBounds_ShouldReportFailure() {
        let four = ComparableValue(4)
        let zero = ComparableValue(0)
        let location = createFailureLocationInThisFileAtTheNextLine()
        assertThat(five).isInRange(zero...four)
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(five) to be in range: \(zero)...\(four)",
            at: location
        )
    }
}
