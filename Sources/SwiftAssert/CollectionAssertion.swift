//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

import Foundation

public extension Assertion where Subject: Collection {
    @discardableResult
    func isEmpty(file: StaticString = #file, line: UInt = #line) -> Self {
        if !subject.isEmpty {
            let failure = Failure(
                text: "Expected \(subject.map { $0 }) to be empty",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
            
        }
        return self
    }
}

public extension Assertion where Subject: Collection, Subject.Element: Equatable {
    @discardableResult
    func hasFirst(_ first: Subject.Element, file: StaticString = #file, line: UInt = #line) -> Self  {
        if let subjectFirst = subject.first {
            if subjectFirst != first {
                let failure = Failure(
                    text: "Expected \(subject.map { $0 }) to have first element \(first)",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
            
        } else {
            let failure = Failure(
                text: "Expected [] to have first element \(first)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}
