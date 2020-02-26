//
//  Created by Yaroslav Zhurakovskiy on 22.02.2020.
//

import SwiftAssert
import XCTest

class AnyObjectAssertion_SameReference_TestCase: AssertionTestCase {
    func test_WhenAddressesMatch_ShouldNotReportAnyFailure() {
        let dummy = DummyObject()
        
        assertThat(dummy).isSameAs(dummy)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func tests_WhenAddressesDoNotMatch_ShouldReportFailure() {
        let dummy1 = DummyObject()
        let dummy2 = DummyObject()
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(dummy1).isSameAs(dummy2)
        
        let dummy1Address = String(addressOf: dummy1)
        let dummy2Address = String(addressOf: dummy2)
        reporterMock.assertOneReportedFailure(
            withText: "Expected DummyObject(\(dummy1Address)) to equal DummyObject(\(dummy2Address))",
            at: location
        )
    }
}
