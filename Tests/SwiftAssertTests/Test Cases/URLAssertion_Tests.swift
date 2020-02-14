//
//  Created by Yaroslav Zhurakovskiy on 14.02.2020.
//

import XCTest
import SwiftAssert

class URLAssertion_Tests: AssertionTestCase {
    func test_WhenSchemaMatches_ShouldNotReportAnyFailuire() {
        let url = URL(fileURLWithPath: #file)
        
        assertThat(url).hasSchema("file")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenSchemaIsMissing_ShouldReportWrongSchema() {
        let url = URL(string: "/Users/fakeuser/Desktop/test.txt")!
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasSchema("test")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have schema 'test'", at: location)
    }
    
    func test_WhenSchemaDoesNotMatch_ShouldReportWrongSchema() {
        let url = URL(fileURLWithPath: #file)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasSchema("test")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have schema 'test'", at: location)
    }
    
    func test_WhenHostMatches_ShouldNotReportAnyFailuire() {
        let url = URL(string: "https://test.com")!
        
        assertThat(url).hasHost("test.com")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenHostDoesNotMatch_ShouldReportWrongHost() {
        let url = URL(string: "https://test.com")!
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasHost("wrong.com")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have host 'wrong.com'", at: location)
    }
    
    func test_WhenHostIsMissing_ShouldReportWrongHost() {
        let url = URL(fileURLWithPath: #file)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasHost("wrong.com")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have host 'wrong.com'", at: location)
    }
    
    func test_WhenPathMatches_ShouldNotReprotAnyFailure() {
        let url = URL(string: "https://test.com/login")!
        
        assertThat(url).hasPath("/login")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenPathDoesNotMatch_ShouldRepotWrongPath() {
        let url = URL(string: "https://test.com/login")!
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasPath("/wrong")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have path '/wrong'", at: location)
    }
}
