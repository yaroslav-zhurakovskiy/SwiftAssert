//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

import SwiftAssert
import XCTest

class CollectionAssertion_Count_TestCase: AssertionTestCase {
    func test_WhenValuesDontMatch_ShouldReportFailure() {
        let collection = AnyCollection([0])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(collection).hasCount(0)
        
        reporterMock.assertOneReportedFailure(withText: "Expected 1 to equal to 0", at: location)
    }
    
    func tests_WhenValuesMatch_ShouldNotReportAnyFailuire() {
        let collection = AnyCollection([0])
                
        assertThat(collection).hasCount(1)
        reporterMock.assertNoReportedFailures()
    }
}

class CollectionAssertion_IsEmpty_TestCase: AssertionTestCase {
    func test_WhenIsNotEmpty_ShouldReportFailure() {
        let collection = AnyCollection([0])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(collection).isEmpty()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [0] to be empty", at: location)
    }
    
    func test_WhenIsEmpty_ShouldNotReportAnyFailure() {
        let collection = AnyCollection<Int>([])
        
        assertThat(collection).isEmpty()
        
        reporterMock.assertNoReportedFailures()
    }
}

class CollectionAssertion_HasFirst_TestsCase: AssertionTestCase {
    func test_WhenCollectionIsEmpty_ShouldReportFailure() {
        let collection = AnyCollection<Int>([])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(collection).hasFirst(0)
        
        reporterMock.assertOneReportedFailure(withText: "Expected [] to have first element 0", at: location)
    }
    
    func test_WhenValuesDontMatch_ShouldReportFailure() {
        let collection = AnyCollection([1, 0])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(collection).hasFirst(0)
        
        reporterMock.assertOneReportedFailure(withText: "Expected [1, 0] to have first element 0", at: location)
    }
    
    func test_WhenValuesMatch_ShouldNotReportAnyFailure() {
        let collection = AnyCollection([1, 0])
        
        assertThat(collection).hasFirst(1)
        
        reporterMock.assertNoReportedFailures()
    }
}

