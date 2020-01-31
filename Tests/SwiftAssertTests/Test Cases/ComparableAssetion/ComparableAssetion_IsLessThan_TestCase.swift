import SwiftAssert
import XCTest

class ComparableAssetion_IsLessThan_TestCase: AssertionTestCase {
    func test_ShouldNotReportFailure_WhenSubjectIsLess() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)
        
        assertThat(zero).isLessThan(one)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_ShouldReportFailure_WhenSubjectIsEqual() {
        let zero = ComparableValue(0)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(zero).isLessThan(zero)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(zero) to be less than \(zero)",
            at: location
        )
    }
    
    func test_ShouldReportFailure_WhenSubjectIsGreater() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(one).isLessThan(zero)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(one) to be less than \(zero)",
            at: location
        )
    }
}
