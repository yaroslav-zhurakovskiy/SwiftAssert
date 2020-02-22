//
//  Created by Yaroslav Zhurakovskiy on 14.02.2020.
//

import SwiftAssert
import XCTest

class DateAssertion_TestCaseBase: AssertionTestCase {
    static let calendar = Calendar.current
    
    let today = calendar.startOfDay(for: Date())
    let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: Date()))!
}

class DateAssetion_Components_TestCase: DateAssertion_TestCaseBase {
    func test_WhenComponentsMatch_ShouldReportNoFailure() {
        var components = DateComponents()
        components.month = 12
        components.day = 31
        components.year = 3_000
        let calendar = Calendar.current
        let date = calendar.date(from: components)!
        
        assertThat(date)
            .hasComponent(.year, withValue: 3_000)
            .hasComponent(.month, withValue: 12)
            .hasComponent(.day, withValue: 31)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenComponentsDoNotMatch_ShouldReportFailures() {
        var components = DateComponents()
        components.month = 12
        components.day = 31
        components.year = 3_000
        let calendar = Calendar.current
        let date = calendar.date(from: components)!
        
        let baseLine: UInt = #line
        assertThat(date)
            .hasComponent(.year, withValue: 3_001)
            .hasComponent(.month, withValue: 13)
            .hasComponent(.day, withValue: 32)
        let yearLocation = createSourceLocationInThisFile(at: baseLine + 2)
        let monthLocation = createSourceLocationInThisFile(at: baseLine + 3)
        let dayLocation = createSourceLocationInThisFile(at: baseLine + 4)
        
        reporterMock.assertHasNumberOfReportedFailures(3)
        reporterMock.assertReportedFailure(
            withText: "Expected 'year' to equal 3001, but got 3000",
            at: yearLocation,
            index: 0
        )
        reporterMock.assertReportedFailure(
            withText: "Expected 'month' to equal 13, but got 12",
            at: monthLocation,
            index: 1
        )
        reporterMock.assertReportedFailure(
            withText: "Expected 'day' to equal 32, but got 31",
            at: dayLocation,
            index: 2
        )
    }
}

class DateAssetion_IsBefore_TestCase: DateAssertion_TestCaseBase {
    func test_WhenDateIsBeforeOther_ShouldReportNoFailures() {
        assertThat(today).isBefore(tomorrow, withGranularity: .day)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenDateIsAfterOther_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(tomorrow).isBefore(today, withGranularity: .day)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(tomorrow) to be before \(today) with granularity day",
            at: location
        )
    }
    
    func test_WhenDateIsEqualToOther_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(tomorrow).isBefore(tomorrow, withGranularity: .day)
        
        reporterMock.assertOneReportedFailure(
            withText: "Expected \(tomorrow) to be before \(tomorrow) with granularity day",
            at: location
        )
    }
}

class DateAssetion_IsAfter_TestCase: DateAssertion_TestCaseBase {
    func test_WhenDateIsAfterOther_ShouldReportNoFailures() {
        assertThat(tomorrow).isAfter(today, withGranularity: .day)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenDateIsBeforeOther_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(today).isAfter(tomorrow, withGranularity: .day)

        reporterMock.assertOneReportedFailure(
            withText: "Expected \(today) to be after \(tomorrow) with granularity day",
            at: location
        )
    }

    func test_WhenDateIsEqualToOther_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(tomorrow).isAfter(tomorrow, withGranularity: .day)

        reporterMock.assertOneReportedFailure(
            withText: "Expected \(tomorrow) to be after \(tomorrow) with granularity day",
            at: location
        )
    }
}


class DateAssetion_IsEqualTo_TestCase: DateAssertion_TestCaseBase {
    func test_WhenDateIsEqualToOther_ShouldReportNoFailures() {
        assertThat(today).isEqualTo(today, withGranularity: .day)

        reporterMock.assertNoReportedFailures()
    }

    func test_WhenDateIsBeforeOther_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(today).isEqualTo(tomorrow, withGranularity: .day)

        reporterMock.assertOneReportedFailure(
            withText: "Expected \(today) to be equal to \(tomorrow) with granularity day",
            at: location
        )
    }

    func test_WhenDateIsAfterOther_ShouldReportFailure() {
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(tomorrow).isEqualTo(today, withGranularity: .day)

        reporterMock.assertOneReportedFailure(
            withText: "Expected \(tomorrow) to be equal to \(today) with granularity day",
            at: location
        )
    }
}
