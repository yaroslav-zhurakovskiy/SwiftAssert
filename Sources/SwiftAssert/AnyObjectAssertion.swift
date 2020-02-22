//
//  Created by Yaroslav Zhurakovskiy on 22.02.2020.
//

public extension Assertion where Subject: AnyObject {
    @discardableResult
    func isSameAs<Other: AnyObject>(_ other: Other, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject !== other {
            let subjectAddress = String(addressOf: subject)
            let otherAddress = String(addressOf: other)
            let subjecType = type(of: subject)
            let otherType = type(of: other)
            
            let failure = Failure(
                text: "Expected \(subjecType)(\(subjectAddress)) to equal \(otherType)(\(otherAddress))",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}

private extension String {
    init<Object: AnyObject>(addressOf object: Object) {
        let opaque: UnsafeMutableRawPointer = Unmanaged.passUnretained(object).toOpaque()
        self.init(describing: opaque)
    }
}
