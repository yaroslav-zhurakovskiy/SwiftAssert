//
//  Created by Yaroslav Zhurakovskiy on 22.02.2020.
//

import Foundation

public class DateAssertion: AnyAssertion<Date> {
    private let calendar: Calendar = .current
    
    @discardableResult
    public func hasComponent(
        _ component: Calendar.Component,
        withValue value: Int,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        let subjectComponentValue = calendar.component(component, from: subject)
        if subjectComponentValue != value {
            let failure = Failure(
                text: "Expected '\(component)' to equal \(value), but got \(subjectComponentValue)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    public func isBefore(
        _ date: Date,
        withGranularity component: Calendar.Component,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if calendar.compare(subject, to: date, toGranularity: component) != .orderedAscending {
            let failure = Failure(
                text: "Expected \(subject) to be before \(date) with granularity \(component)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    public func isAfter(
        _ date: Date,
        withGranularity component: Calendar.Component,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if calendar.compare(subject, to: date, toGranularity: component) != .orderedDescending {
            let failure = Failure(
                text: "Expected \(subject) to be after \(date) with granularity \(component)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    public func isEqualTo(
        _ date: Date,
        withGranularity component: Calendar.Component,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if calendar.compare(subject, to: date, toGranularity: component) != .orderedSame {
            let failure = Failure(
                text: "Expected \(subject) to be equal to \(date) with granularity \(component)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}

public func assertThat(_ subject: Date) -> DateAssertion {
    return DateAssertion(subject: subject)
}
