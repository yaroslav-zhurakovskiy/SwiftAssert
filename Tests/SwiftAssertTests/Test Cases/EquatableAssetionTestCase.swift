import SwiftAssert
import XCTest

class EquatableAssetion_IsEqualTo_TestCase: AssertionTestCase {
    func test_WhenValuesAreEqual_ShouldNotRecordAnyFailure() {
        let zero = EquatableValue(0)
        
        assertThat(zero).isEqualTo(zero)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenValuesAreNotEqual_ShouldRecordFailure() {
        let zero = EquatableValue(0)
        let one = EquatableValue(1)
        
        let location = createFailureLocationInThisFileAtTheNextLine()
        assertThat(zero).isEqualTo(one)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(zero) to equal to \(one)",
            at: location
        )
    }
    
    func test_ShouldSupportFluentStyle() {
        let zero = EquatableValue(0)
        let one = EquatableValue(1)
        
        assertThat(zero)
            .isEqualTo(one)
            .isEqualTo(one)
        
        reporterMock.assertHasNumberOfReportedFailures(2)
    }
}

class EquatableAssetion_IsNotEqualTo_TestCase: AssertionTestCase {
    func test_WhenValuesAreNotEqual_ShouldNotReportAnyFailure() {
        let zero = EquatableValue(0)
        let one = EquatableValue(1)
        
        assertThat(zero).isNotEqualTo(one)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenValuesAreEqual_ShouldReportFailure() {
        let zero = EquatableValue(0)
        
        let location = createFailureLocationInThisFileAtTheNextLine()
        assertThat(zero).isNotEqualTo(zero)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(zero) not to equal \(zero)",
            at: location
        )
    }
    
    func test_ShouldSupportFluentStyle() {
        let zero = EquatableValue(0)
        
        assertThat(zero)
            .isNotEqualTo(zero)
            .isNotEqualTo(zero)
        
        reporterMock.assertHasNumberOfReportedFailures(2)
    }
}

class EquatableAssetion_FluentStyle_TestCase: AssertionTestCase {
    func test_ShouldSupportFluentStyle() {
        let zero = EquatableValue(0)
        let one = EquatableValue(1)
        
        assertThat(zero)
            .isEqualTo(one)
            .isEqualTo(one)
            .isNotEqualTo(zero)
            .isNotEqualTo(zero)
        
        reporterMock.assertHasNumberOfReportedFailures(4)
    }
}
