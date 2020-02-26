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
    
    @discardableResult
    func hasUser(_ user: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.user != user {
            let failure = Failure(
                text: "Expected \(subject) to have user '\(user)'",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func hasPassword(_ password: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.password != password {
            let failure = Failure(
                text: "Expected \(subject) to have password '\(password)'",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func hasPort(_ port: Int, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.port != port {
            let failure = Failure(
                text: "Expected \(subject) to have port '\(port)'",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func isFileURL(file: StaticString = #file, line: UInt = #line) -> Self {
        if !subject.isFileURL {
            let failure = Failure(
                text: "Expected \(subject) to be file url",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func isNotFileURL(file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.isFileURL {
            let failure = Failure(
                text: "Expected \(subject) not to be file url",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func hasLastPathComponent(_ lastPathComponent: String, file: StaticString = #file, line: UInt = #line) -> Self {
        assertThat(subject.lastPathComponent).isEqualTo(lastPathComponent, file: file, line: line)
        return self
    }
    
    @discardableResult
    func hasPathExtension(_ pathExtension: String, file: StaticString = #file, line: UInt = #line) -> Self {
        assertThat(subject.pathExtension).isEqualTo(pathExtension, file: file, line: line)
        return self
    }
}
