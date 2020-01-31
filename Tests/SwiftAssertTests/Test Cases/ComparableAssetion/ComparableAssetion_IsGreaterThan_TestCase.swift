import SwiftAssert
import XCTest

class ComparableAssetion_IsGreaterThan_TestCase: AssertionTestCase {
    func test_ShouldNotReportFailure_WhenSubjectIsGreater() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)
        
        assertThat(one).isGreaterThan(zero)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_ShouldReportFailure_WhenSubjectIsEqual() {
        let zero = ComparableValue(0)

        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(zero).isGreaterThan(zero)

        reporterMock.assertOneReportedFailure(
            withText: "Expected \(zero) to be greater than \(zero)",
            at: location
        )
    }

    func test_ShouldReportFailure_WhenSubjectIsLess() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)

        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(zero).isGreaterThan(one)

        reporterMock.assertOneReportedFailure(
            withText: "Expected \(zero) to be greater than \(one)",
            at: location
        )
    }
}
