//
//  Created by Yaroslav Zhurakovskiy on 22.02.2020.
//

import Foundation

public extension Assertion where Subject: UserDefaults {
    @discardableResult
    func hasNothing(forKey key: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if let value = subject.object(forKey: key) {
            let failure = Failure(
                text: "Expected nothing for '\(key)', but got \(value)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func hasString(
        forKey key: String,
        that spec: (AnyAssertion<String>) -> Void,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if let value = subject.string(forKey: key) {
            spec(AnyAssertion(subject: value))
        } else {
            if let value = subject.object(forKey: key) {
                let failure = Failure(
                    text: "Expected string for '\(key)', but got \(value)",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            } else {
                let failure = Failure(
                    text: "Expected string for '\(key)', but got nothing",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        }
        return self
    }
    @discardableResult
    func hasInt(
        forKey key: String,
        that spec: (AnyAssertion<Int>) -> Void,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if let value = subject.object(forKey: key) as? Int {
            spec(AnyAssertion(subject: value))
        } else {
            if let value = subject.object(forKey: key) {
                let failure = Failure(
                    text: "Expected int for '\(key)', but got \(value)",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            } else {
                let failure = Failure(
                    text: "Expected int for '\(key)', but got nothing",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        }
        return self
    }
}
