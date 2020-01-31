 public struct SourceLocation {
    public let filePath: StaticString
    public let line: UInt
    
    public init(filePath: StaticString, line: UInt) {
        self.filePath = filePath
        self.line = line
    }
 }

public struct Failure {
    public let text: String
    public let location: SourceLocation
    
    public init(text: String, location: SourceLocation) {
        self.text = text
        self.location = location
    }
}
