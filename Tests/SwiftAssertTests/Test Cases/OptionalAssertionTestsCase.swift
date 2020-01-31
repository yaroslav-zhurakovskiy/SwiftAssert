import SwiftAssert
import XCTest

class OptionalAssertion_CheckingIfValueIsNil_TestCase: AssertionTestCase {
    func test_ShouldNotReporFailure_WhenValueIsNil() {
        let numberOrNil: Int? = nil
        
        assertThat(numberOrNil).isNil()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_ShouldReportFailure_WhenValueIsNotNil() {
        let numberOrNil: Int? = 1
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(numberOrNil).isNil()
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected nil but was: \(numberOrNil!)",
            at: location
        )
    }
}


class OptionalAssertion_CheckingIfValueIsNotNil_TestCase: AssertionTestCase {
    func test_ShouldNotReportFaliure_WhenValueIsNotNil() {
        let numberOrNil: Int? = 1
        
        assertThat(numberOrNil).isNotNil()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_ShouldReportFaliure_WhenValueIsNil() {
        let numberOrNil: Int? = nil
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(numberOrNil).isNotNil()
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected value not to be nil",
            at: location
        )
    }
}

class OptionalAssertion_CheckingIfValueIsNotNilAndPerformingOtherAssertion_TestCase: AssertionTestCase {
    func test_ShouldReportFaliure_WhenValueIsNil() {
        let numberOrNil: Int? = nil
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(numberOrNil).isNotNilAnd { $0.isEqualTo(0) }
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected value not to be nil",
            at: location
        )
    }
    
    func test_shouldAssertOnWrappedType_WhenValueIsNotNil() {
        let numberOrNil: Int? = 0
        let comparasionValue = 1
        
        let location = createSourceLocationInThisFile(at: #line + 2)
        assertThat(numberOrNil).isNotNilAnd { (number: AnyAssertion<Int>) in
            number.isEqualTo(comparasionValue)
        }
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(numberOrNil!) to equal to \(comparasionValue)",
            at: location
        )
    }
}
