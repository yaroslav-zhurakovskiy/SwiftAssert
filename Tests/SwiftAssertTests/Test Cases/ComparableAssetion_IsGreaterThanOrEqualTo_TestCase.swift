import SwiftAssert
import XCTest

class ComparableAssetion_IsGreaterThanOrEqualTo_TestCase: AssertionTestCase {
    func test_ShouldNotReportFailure_WhenSubjectIsGreater() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)

        assertThat(one).isGreaterThanOrEqualTo(zero)

        reporterMock.assertNoReportedFailures()
    }

    func test_ShouldNotReportFailure_WhenSubjectIsEqualTo() {
        let zero = ComparableValue(0)

        assertThat(zero).isGreaterThanOrEqualTo(zero)

        reporterMock.assertNoReportedFailures()
    }

    func test_ShouldReportFailure_WhenSubjectIsLess() {
        let zero = ComparableValue(0)
        let one = ComparableValue(1)

        let location = createFailureLocationInThisFileAtTheNextLine()
        assertThat(zero).isGreaterThanOrEqualTo(one)

        reporterMock.assertOneReportedFailure(
            withText: "Expected \(zero) to be greater than or equal to \(one)",
            at: location
        )
    }
}
