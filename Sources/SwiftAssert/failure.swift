//
//  Created by Yaroslav Zhurakovskiy on 27.02.2020.
//

public func failure(_ reason: String, file: StaticString = #file, line: UInt = #line) {
    let failure = Failure(text: reason, location: SourceLocation(filePath: file, line: line))
    FailureReporterHolder.sharedReporter.reportFailure(failure)
}
