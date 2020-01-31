import XCTest
import SwiftAssert

class HashableAssertion_TestCase: AssertionTestCase {
    func test_WhenHashValuesMatch_ShouldNotReportFailure() {
        let zero = HashableValue(0)
        
        assertThat(zero).hasHashValue(zero.hashValue)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenHashValuesDontMatch_ShouldReportFailure() {
        let zero = HashableValue(0)
        let expectedHashValue = 1.hashValue
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(zero).hasHashValue(expectedHashValue)
       
        reporterMock.assertOneReportedFailure(
            withText:
            """
            Expected hash value of \(zero) to be:
                \(expectedHashValue)
            but was:
                \(zero.hashValue)
            """,
            at: location
        )
    }
    
    func test_ShouldSupportFluentSyntax() {
        let zero = HashableValue(0)
        let expectedHashValue = 1.hashValue
        
        assertThat(zero)
            .hasHashValue(expectedHashValue)
            .hasHashValue(expectedHashValue)
        
        reporterMock.assertHasNumberOfReportedFailures(2)
    }
}
