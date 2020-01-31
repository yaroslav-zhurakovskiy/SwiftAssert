import XCTest
import SwiftAssert

class ComparableAssertion_FluentStyle_TestCase: AssertionTestCase {
    func test_ShouldSupportFluentStyle() {
        let zero = ComparableValue(0)
        let ten = ComparableValue(10)
        let eleven = ComparableValue(11)
        let nine = ComparableValue(9)
        
        assertThat(ten)
            .isLessThan(nine)
            .isGreaterThan(eleven)
            .isLessThanOrEqualTo(nine)
            .isGreaterThanOrEqualTo(eleven)
            .isInRange(zero..<nine)
            .isInRange(zero...nine)
        
        reporterMock.assertHasNumberOfReportedFailures(6)
    }
}
