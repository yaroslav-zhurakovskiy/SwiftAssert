//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

import Foundation

public class CodeBlockAssertion {
    let caughError: Error?
    let caughtNotifications: [Notification]
    
    fileprivate init(caughError: Error?, caughtNotifications: [Notification]) {
        self.caughError = caughError
        self.caughtNotifications = caughtNotifications
    }
    
    fileprivate convenience init(code: () throws -> Void) {
        var caughError: Error?
        var postedNotifications: [Notification] = []
        let observer = NotificationCenter.default.addObserver(
            forName: nil,
            object: nil,
            queue: nil,
            using: { postedNotifications.append($0) }
        )
        do {
            try code()
        } catch let error {
            caughError = error
        }
        NotificationCenter.default.removeObserver(observer)
        self.init(caughError: caughError, caughtNotifications: postedNotifications)
    }
    
    @discardableResult
    public func doesNotThrowAnyError(file: StaticString = #file, line: UInt = #line) -> Self {
        if let caughError = caughError {
            let failure = Failure(
                text: "Expected no errors, but got \(caughError)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    public func throwsError(file: StaticString = #file, line: UInt = #line) -> Self {
        if caughError == nil {
            let failure = Failure(
                text: "Expected an error, but got nothing",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    public func throwsError<Error: Swift.Error>(
        ofType type: Error.Type,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if let caughError = caughError {
            if !(caughError is Error) {
                let failure = Failure(
                    text: "Expected \(caughError) to be \(type)",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        } else {
            let failure = Failure(
                text: "Expected an error, but got nothing",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    public func throwsError<Error: Swift.Error>(
        ofType type: Error.Type,
        that spec: (AnyAssertion<Error>) -> Void,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if let caughError = caughError {
            if let typedError = caughError as? Error {
                spec(AnyAssertion(subject: typedError))
            } else {
                let failure = Failure(
                    text: "Expected \(caughError) to be \(type)",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        } else {
            let failure = Failure(
                text: "Expected an error, but got nothing",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    public func doesNotPostAnyNotification(file: StaticString = #file, line: UInt = #line) -> Self {
        if caughtNotifications.count > 0 {
            let failure = Failure(
                text: "Expected no notifications, but got \(caughtNotifications.map { $0.name.rawValue })",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    public func postsNotification(
        named notificationName: Notification.Name,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self {
        if caughtNotifications.count > 0 {
            let names = caughtNotifications.map { $0.name.rawValue }
            if !names.contains(notificationName.rawValue) {
                let failure = Failure(
                    text: "Expected notification named \"\(notificationName.rawValue)\", but got \(names)",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        } else {
            let failure = Failure(
                text: "Expected notification named \"\(notificationName.rawValue)\", but got nothing",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}


public func assertThatCode(_ code: () throws -> Void) -> CodeBlockAssertion {
   return CodeBlockAssertion(code: code)
}

public func assertThatCode(_ code: @autoclosure () throws -> Void) -> CodeBlockAssertion {
    return CodeBlockAssertion(code: code)
}
