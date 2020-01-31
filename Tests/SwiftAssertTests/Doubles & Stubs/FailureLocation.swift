import SwiftAssert

func createSourceLocationInThisFile(at line: UInt, file: StaticString = #file) -> SourceLocation {
    return SourceLocation(filePath: file, line: line)
}

func createSourceLocationInThisFileAtTheNextLine(file: StaticString = #file, line: UInt = #line) -> SourceLocation {
    return SourceLocation(filePath: file, line: line + 1)
}
