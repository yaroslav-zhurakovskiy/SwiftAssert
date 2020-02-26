//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

@testable import SwiftAssert
import XCTest

class CodeBlockAssertion_DoesNotThrowError_TestCase: AssertionTestCase {
    func test_WhenBlockThrowsError_ShouldReportFailure() {
        let dummyError = DummyError()
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThatCode { throw  dummyError }.doesNotThrowAnyError()
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected no errors, but got \(dummyError)",
            at: location
        )
    }
    
    func test_WhenBlockDoesNotThrowAnyError_ShouldNoReporyAnyFailure() {
        assertThatCode {  }.doesNotThrowAnyError()
        
        reporterMock.assertNoReportedFailures()
    }
}

class CodeBlockAssertion_ThrowsError_TestCase: AssertionTestCase {
    func test_WhenBlockDoesNotThrowError_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThatCode {  }.throwsError()
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected an error, but got nothing",
            at: location
        )
    }
}

class CodeBlockAssertion_ThrowsErrorOfType_TestCase: AssertionTestCase {
    func test_WhenBlockDoesNotThrowError_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThatCode {  }.throwsError(ofType: DummyError.self)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected an error, but got nothing",
            at: location
        )
    }
    
    func test_WhneBlockThrowsErrorOfWrongType_ShouldReportFailuire() {
        class WrongError: Error {
            
        }
        let wrongError = WrongError()
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThatCode { throw wrongError }.throwsError(ofType: DummyError.self)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(wrongError) to be DummyError",
            at: location
        )
    }
}

class CodeBlockAssertion_ThrowsErrorOfTypeThat_TestCase: AssertionTestCase {
    func test_WhenBlockDoesNotThrowError_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThatCode {  }.throwsError(ofType: DummyError.self, that: { _ in  })
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected an error, but got nothing",
            at: location
        )
    }
    
    func test_WhneBlockThrowsErrorOfWrongType_ShouldReportFailuire() {
        class WrongError: Error {
            
        }
        let wrongError = WrongError()
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThatCode { throw wrongError }.throwsError(ofType: DummyError.self, that: { _ in  })
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(wrongError) to be DummyError",
            at: location
        )
    }
    
    func test_WhenBlockThrowsError_ShouldMakeAssertionOnThatError() {
        let dummyError = DummyError()
        let wrongDummyError = DummyError()
        
        let location = createSourceLocationInThisFile(at: #line + 2)
        assertThatCode { throw dummyError  }
            .throwsError(ofType: DummyError.self, that: { $0.isSameAs(wrongDummyError) })
        
        let dummyErrorAddress = String(addressOf: dummyError)
        let wrongDummyErrorAddress = String(addressOf: wrongDummyError)
        reporterMock.assertOneReportedFailure(
            withText: "Expected DummyError(\(dummyErrorAddress)) to equal DummyError(\(wrongDummyErrorAddress))",
            at: location
        )
    }
}

class CodeBlockAssertion_Autoclosure_TestCase: AssertionTestCase {
    func test_shouldSupportAutoclosure() {
        XCTAssertNil(assertThatCode(try nonThrowingMethod()).caughError, "Should not catch any exception")
        XCTAssertNotNil(assertThatCode(try throwingMethod()).caughError, "Should catch an exception")
    }
    
    private func nonThrowingMethod() throws {
        
    }
    
    private func throwingMethod() throws {
        throw DummyError()
    }
}
