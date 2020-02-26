//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

import SwiftAssert
import XCTest

class SequenceAssertion_ContainsElement_TestsCase: AssertionTestCase {
    func test_WhenSequenceIsEmpty_ShouldReportFailure() {
        let sequence = AnySequence<Int>([])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).contains(0)
        
        reporterMock.assertOneReportedFailure(withText: "Expected [] to contain 0", at: location)
    }
    
    func test_WhenValueIsMissing_ShouldReportFailure() {
        let sequence = AnySequence([1, 0])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).contains(-1)
        
        reporterMock.assertOneReportedFailure(withText: "Expected [1, 0] to contain -1", at: location)
    }
    
    func test_WhenValueIsPresent_ShouldNotReportAnyFailure() {
        let sequence = AnySequence([1, 0])
        
        assertThat(sequence).contains(1)
        
        reporterMock.assertNoReportedFailures()
    }
}

class SequenceAssertion_IsSorted_UsingDefaultComparison_TestsCase: AssertionTestCase {
    func test_WhenSequenceIsEmpty_ShouldNotReportAnyFailure() {
        let sequence = AnySequence<Int>([])
        
        assertThat(sequence).isSorted()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenIsNotSorted_ShouldReportFailure() {
        let sequence = AnySequence([2, 0, 1])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).isSorted()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [2, 0, 1] to be sorted", at: location)
    }
    
    func test_WhenIsSorted_ShouldNotReportAnyFailure() {
        let sequence = AnySequence([0, 1, 2])
        
        assertThat(sequence).isSorted()
        
        reporterMock.assertNoReportedFailures()
    }
}

class SequenceAssertion_IsSorted_UsingAdHocComparison_TestsCase: AssertionTestCase {
    func test_WhenSequenceIsEmpty_ShouldNotReportAnyFailure() {
        let sequence = AnySequence<Int>([])
        
        assertThat(sequence).isSorted(by: <)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenIsNotSorted_ShouldReportFailure() {
        let sequence = AnySequence([2, 0, 1])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).isSorted(by: <)
        
        reporterMock.assertOneReportedFailure(withText: "Expected [2, 0, 1] to be sorted", at: location)
    }
    
    func test_WhenIsSorted_ShouldNotReportAnyFailure() {
        let sequence = AnySequence([0, 1, 2])
        
        assertThat(sequence).isSorted(by: <)
        
        reporterMock.assertNoReportedFailures()
    }
}

class SequenceAssertion_MaxElement_TestsCase: AssertionTestCase {
    func test_WhenSequenceIsEmpty_ShouldReportFailure() {
        let sequence = AnySequence<Int>([])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).hasMax(1)
        
        reporterMock.assertOneReportedFailure(withText: "Expected max element of [] to be 1", at: location)
    }
    
    func test_WhenValuesDoNotMatch_ShouldNotReportAnyFailure() {
        let sequence = AnySequence<Int>([0, 1, 2])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).hasMax(1)
        
        reporterMock.assertOneReportedFailure(withText: "Expected max element of [0, 1, 2] to be 1", at: location)
    }
    
    func test_WhenValuesMatch_ShouldNotReportAnyFailure() {
        let sequence = AnySequence<Int>([0, 1])
        
        assertThat(sequence).hasMax(1)
        
        reporterMock.assertNoReportedFailures()
    }
}

class SequenceAssertion_MinElement_TestsCase: AssertionTestCase {
    func test_WhenSequenceIsEmpty_ShouldReportFailure() {
        let sequence = AnySequence<Int>([])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).hasMin(0)
        
        reporterMock.assertOneReportedFailure(withText: "Expected min element of [] to be 0", at: location)
    }
    
    func test_WhenValuesDoNotMatch_ShouldNotReportAnyFailure() {
        let sequence = AnySequence<Int>([-1, 0, 1])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).hasMin(0)
        
        reporterMock.assertOneReportedFailure(withText: "Expected min element of [-1, 0, 1] to be 0", at: location)
    }
    
    func test_WhenValuesMatch_ShouldNotReportAnyFailure() {
        let sequence = AnySequence<Int>([0, 1])
        
        assertThat(sequence).hasMin(0)
        
        reporterMock.assertNoReportedFailures()
    }
}

class SequenceAssertion_StartsWith_TestsCase: AssertionTestCase {
    func test_WhenSequenceIsEmpty_ShouldReportFailure() {
        let sequence = AnySequence<Int>([])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).starts(with: AnySequence([0, 1]))
        
        reporterMock.assertOneReportedFailure(withText: "Expected [] to start with [0, 1]", at: location)
    }
    
    func test_WhenSequenceDoesNotStartWithPreix_ShouldReportFailure() {
        let sequence = AnySequence<Int>([1, 0])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).starts(with: AnySequence([0, 1]))
        
        reporterMock.assertOneReportedFailure(withText: "Expected [1, 0] to start with [0, 1]", at: location)
    }
    
    func test_WhenSequenceStartsWithPreix_ShouldNotReportAnyFailure() {
        let sequence = AnySequence<Int>([0, 1])
        
        assertThat(sequence).starts(with: AnySequence([0, 1]))
        
        reporterMock.assertNoReportedFailures()
    }
}

class SequenceAssertion_ContainsElements_TestsCase: AssertionTestCase {
    func test_WhenSequenceIsEmpty_ShouldReportFailure() {
        let sequence = AnySequence<Int>([])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).contains(AnySequence([1, 2]))
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected []
            To Contain: [1, 2]
            Missing: [1, 2]
            """,
            at: location
        )
    }
    
    func test_WhenElementsAreMissing_ShouldReportFailure() {
        let sequence = AnySequence([0, 1])

        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(sequence).contains([1, 2, 3, 4])

        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [0, 1]
            To Contain: [1, 2, 3, 4]
            Missing: [2, 3, 4]
            """,
            at: location
        )
    }

    func test_WhenElementsArePresent_ShouldNotReportAnyFailure() {
        let sequence = AnySequence([0, 1, 2, 3])

        assertThat(sequence).contains([0, 1, 2, 3])

        reporterMock.assertNoReportedFailures()
    }
}
