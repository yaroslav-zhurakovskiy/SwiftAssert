import SwiftAssert

func createFailureLocationInThisFile(at line: UInt, file: StaticString = #file) -> Failure.Location {
    return Failure.Location(fileName: file, line: line)
}

func createFailureLocationInThisFileAtTheNextLine(file: StaticString = #file, line: UInt = #line) -> Failure.Location {
    return Failure.Location(fileName: file, line: line + 1)
}
