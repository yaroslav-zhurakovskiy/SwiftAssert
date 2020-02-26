//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

public class CodeBlockAssertion {
    let caughError: Error?
    
    fileprivate init(caughError:  Error?) {
        self.caughError = caughError
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
}


public func assertThatCode(_ code: () throws -> Void) -> CodeBlockAssertion {
    do {
        try code()
        return CodeBlockAssertion(caughError: nil)
    } catch let error {
        return CodeBlockAssertion(caughError: error)
    }
}


public func assertThatCode(_ code: @autoclosure () throws -> Void) -> CodeBlockAssertion {
    do {
        try code()
        return CodeBlockAssertion(caughError: nil)
    } catch let error {
        return CodeBlockAssertion(caughError: error)
    }
}
