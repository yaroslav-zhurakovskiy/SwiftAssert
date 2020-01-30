import SwiftAssert
import XCTest

class EquatableAssetionTestCase: AssertionTestCase {
    func testShouldNotRecordAnyFailureWhenValuesAreEqual() {
        let zero = EquatableValue(0)
        
        assertThat(zero).isEqualTo(zero)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func testShouldRecordFailureWhenValuesAreNotEqual() {
        let zero = EquatableValue(0)
        let one = EquatableValue(1)
        
        let location = createFailureLocationInThisFileAtTheNextLine()
        assertThat(zero).isEqualTo(one)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(zero) to equal to \(one)",
            at: location
        )
    }
}
