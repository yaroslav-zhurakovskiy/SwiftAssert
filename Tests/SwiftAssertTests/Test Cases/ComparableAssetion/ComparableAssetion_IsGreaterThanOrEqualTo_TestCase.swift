import SwiftAssert
import XCTest

class ComparableAssetion_IsGreaterThanOrEqualTo_TestCase: AssertionTestCase {
    func test_WhenSubjectIsGreater_ShouldNotReportFailure() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)

        assertThat(one).isGreaterThanOrEqualTo(zero)

        reporterMock.assertNoReportedFailures()
    }

    func test_WhenSubjectAndValueAreEqual_ShouldNotReportFailure() {
        let zero = ComparableValue(0)

        assertThat(zero).isGreaterThanOrEqualTo(zero)

        reporterMock.assertNoReportedFailures()
    }

    func test_WhenSubjectIsLess_ShouldReportFailure() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(zero).isGreaterThanOrEqualTo(one)

        reporterMock.assertOneReportedFailure(
            withText: "Expected \(zero) to be greater than or equal to \(one)",
            at: location
        )
    }
}
