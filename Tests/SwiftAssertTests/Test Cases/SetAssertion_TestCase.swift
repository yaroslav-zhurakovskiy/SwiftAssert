//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

import SwiftAssert
import XCTest

class SetAssertion_Capacity_TestCase: AssertionTestCase {
    func test_WhenCapacityMatches_ShouldNotReportAnyFailure() {
        let set = Set([1, 2, 3])
        
        assertThat(set).hasCapacity(set.capacity)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenCapacityDoesNotMatch_ShouldNotReportAnyFailure() {
        let set = Set([1, 2, 3])
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(set).hasCapacity(0)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(set.capacity) to equal to 0",
            at: location
        )
    }
}
