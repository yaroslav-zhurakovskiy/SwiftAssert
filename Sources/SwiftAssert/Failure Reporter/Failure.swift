public struct Failure {
    public struct Location {
        public let fileName: StaticString
        public let line: UInt
        
        public init(fileName: StaticString = #file, line: UInt = #line) {
            self.fileName = fileName
            self.line = line
        }
    }
    
    public let text: String
    public let location: Location
    
    public init(text: String, location: Location) {
        self.text = text
        self.location = location
    }
}
