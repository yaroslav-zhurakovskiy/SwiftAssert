//
//  Created by Yaroslav Zhurakovskiy on 14.02.2020.
//

import Foundation


public extension Assertion where Subject == URL {
    @discardableResult
    func hasSchema(_ schema: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if let subjectSchema = subject.scheme {
            if subjectSchema != schema {
                let failure = Failure(
                    text: "Expected \(subject) to have schema '\(schema)'",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        } else {
            let failure = Failure(
                text: "Expected \(subject) to have schema '\(schema)'",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func hasHost(_ host: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if let subjectHost = subject.host {
            if subjectHost != host {
                let failure = Failure(
                    text: "Expected \(subject) to have host '\(host)'",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        } else {
            let failure = Failure(
                text: "Expected \(subject) to have host '\(host)'",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func hasPath(_ path: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.path != path {
            let failure = Failure(
                text: "Expected \(subject) to have path '\(path)'",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}
