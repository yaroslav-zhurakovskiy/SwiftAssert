//
//  Created by Yaroslav Zhurakovskiy on 22.02.2020.
//

import SwiftAssert
import XCTest

class UserDefaultsAssertion_HasNothing_TestCase: AssertionTestCase {
    let userDefaults = UserDefaults.standard
    let key = "TEST_KEY"
    
    override func tearDown() {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
        
        super.tearDown()
    }
    
    func test_WhenHasNoObjectForKey_ShouldNotReportAnyFailure() {
        assertThat(userDefaults).hasNothing(forKey: key)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenContainsObjectForKey_ShouldReportFailure() {
        userDefaults.set("DUMMY", forKey: key)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(userDefaults).hasNothing(forKey: key)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected nothing for '\(key)', but got DUMMY",
            at: location
        )
    }
}

class UserDefaultsAssertion_HasString_TestCase: AssertionTestCase {
    let userDefaults = UserDefaults.standard
    let key = "TEST_KEY"
    
    override func tearDown() {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
        
        super.tearDown()
    }
    
    func test_WhenHasStringForKey_ShouldNotReportAnyFailure() {
        userDefaults.set("DUMMY", forKey: key)
        assertThat(userDefaults).hasString(forKey: key, that: { $0.isEqualTo("DUMMY") })
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenStringIsMissingForKey_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(userDefaults).hasString(forKey: key, that: { $0.isEqualTo("DUMMY") })
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected string for '\(key)', but got nothing",
            at: location
        )
    }
    
    func test_WhenHasStringForKey_ShouldMakeAssertionOnThatValue() {
        userDefaults.set("DUMMY", forKey: key)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(userDefaults).hasString(forKey: key, that: { $0.isEqualTo("WRONG DUMMY") })
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected DUMMY to equal to WRONG DUMMY",
            at: location
        )
    }
    
    func test_WhenHasNonStringObjectForKey_ShouldReportFailure() {
        let storedDate = Date()
        userDefaults.set(storedDate, forKey: key)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(userDefaults).hasString(forKey: key, that: { $0.isEqualTo("WRONG DUMMY") })
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected string for '\(key)', but got \(storedDate)",
            at: location
        )
    }
}

class UserDefaultsAssertion_HasInt_TestCase: AssertionTestCase {
    let userDefaults = UserDefaults.standard
    let key = "TEST_KEY"
    
    override func tearDown() {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
        
        super.tearDown()
    }
    
    func test_WhenHasNumberForKey_ShouldNotReportAnyFailure() {
        userDefaults.set(0, forKey: key)
        assertThat(userDefaults).hasInt(forKey: key, that: { $0.isEqualTo(0) })
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenNumberIsMissingForKey_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(userDefaults).hasInt(forKey: key, that: { _ in })

        reporterMock.assertOneReportedFailure(
            withText: "Expected int for '\(key)', but got nothing",
            at: location
        )
    }

    func test_WhenHasNumberForKey_ShouldMakeAssertionOnThatValue() {
        userDefaults.set(0, forKey: key)

        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(userDefaults).hasInt(forKey: key, that: { $0.isEqualTo(1) })

        reporterMock.assertOneReportedFailure(
            withText: "Expected 0 to equal to 1",
            at: location
        )
    }

    func test_WhenHasNonIntObjectForKey_ShouldReportFailure() {
        let storedDate = Date()
        userDefaults.set(storedDate, forKey: key)

        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(userDefaults).hasInt(forKey: key, that: { _ in })

        reporterMock.assertOneReportedFailure(
            withText: "Expected int for '\(key)', but got \(storedDate)",
            at: location
        )
    }
}
