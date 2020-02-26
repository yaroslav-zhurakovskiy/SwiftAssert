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
    
    func test_WhenDoesNotConainUser_ShouldReportFailure() {
        let url = URL(fileURLWithPath: #file)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasUser("user")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have user 'user'", at: location)
    }
    
    func test_WhenUserDoesNotMatch_ShouldReportFailure() {
        let url = URL(string: "test://wrong@test.com")!
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasUser("user")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have user 'user'", at: location)
    }
    
    func test_WhenUserDoesMatches_ShouldReportNoFailure() {
        let url = URL(string: "test://user@test.com")!
        
        assertThat(url).hasUser("user")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenPasswordIsMissing_ShouldReportFailuire() {
        let url = URL(fileURLWithPath: #file)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasPassword("password")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have password 'password'", at: location)
    }
    
    func test_WhenPasswordsDoNotMatch_ShouldReportFailuire() {
        let url = URL(string: "test://user:wrongpassword@test.com")!
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasPassword("password")
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have password 'password'", at: location)
    }
    
    func test_WhenPasswordsMatch_ShouldNoReportAnyFailure() {
        let url = URL(string: "test://user:password@test.com")!
        
        assertThat(url).hasPassword("password")
        
        reporterMock.assertNoReportedFailures()
    }
    //
    func test_WhenPortIsMissing_ShouldReportFailuire() {
        let url = URL(fileURLWithPath: #file)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasPort(1)
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have port '1'", at: location)
    }
    
    func test_WhenPortsDoNotMatch_ShouldReportFailuire() {
        let url = URL(string: "test://test.com")!
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasPort(1)
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to have port '1'", at: location)
    }
    
    func test_WhenPortsMatch_ShouldNoReportAnyFailure() {
        let url = URL(string: "test://test.com:1")!
        
        assertThat(url).hasPort(1)
        
        reporterMock.assertNoReportedFailures()
    }
}

class URLAssertion_IsFileURL_TestCase: AssertionTestCase {
    func test_WhenIsNotFileURL_ShouldReportFailure() {
        let url = URL(string: "test://test.com")!
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).isFileURL()
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) to be file url", at: location)
    }
    
    func test_WhenIsFileURL_ShouldNotReportAnyFailure() {
        let url = URL(fileURLWithPath: #file)
        
        assertThat(url).isFileURL()
        
        reporterMock.assertNoReportedFailures()
    }
}

class URLAssertion_IsNotFileURL_TestCase: AssertionTestCase {
    func test_WhenIsNotFileURL_ShouldNotReportAnyFailure() {
        let url = URL(string: "test://test.com")!
        
        assertThat(url).isNotFileURL()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenIsFileURL_ShouldReportFailure() {
        let url = URL(fileURLWithPath: #file)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).isNotFileURL()
        
        reporterMock.assertOneReportedFailure(withText: "Expected \(url) not to be file url", at: location)
    }
}

class URLAssertion_LastPathComponent_TestCase: AssertionTestCase {
    let url = URL(string: "test://test.com/api/feed.json")!
    
    func test_WhenValuesDoNotMatch_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasLastPathComponent("wrong.json")
        
        reporterMock.assertOneReportedFailure(withText: "Expected feed.json to equal to wrong.json", at: location)
    }
    
    func test_WhenValuesMatch_ShouldReportNoFailure() {
        assertThat(url).hasLastPathComponent("feed.json")
        
        reporterMock.assertNoReportedFailures()
    }
}

class URLAssertion_PathExtension_TestCase: AssertionTestCase {
    let url = URL(string: "test://test.com/api/feed.json")!
    
    func test_WhenValuesDoNotMatch_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(url).hasPathExtension("wrong")
        
        reporterMock.assertOneReportedFailure(withText: "Expected json to equal to wrong", at: location)
    }
    
    func test_WhenValuesMatch_ShouldReportNoFailure() {
        assertThat(url).hasPathExtension("json")
        
        reporterMock.assertNoReportedFailures()
    }
}
