import SwiftAssert
import XCTest

class ComparableAssetion_IsLessThanOrEqualTo_TestCase: AssertionTestCase {
    func test_ShouldNotReportFailure_WhenSubjectIsLess() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)
        
        assertThat(zero).isLessThanOrEqualTo(one)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_ShouldNotReportFailure_WhenSubjectIsEqualTo() {
        let zero = ComparableValue(0)
        
        assertThat(zero).isLessThanOrEqualTo(zero)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_ShouldReportFailure_WhenSubjectIsGreater() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(one).isLessThanOrEqualTo(zero)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(one) to be less than or equal to \(zero)",
            at: location
        )
    }
}
