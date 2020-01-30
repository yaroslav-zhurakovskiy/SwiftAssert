struct EquatableValue<Value: Equatable>: Equatable {
    private let value: Value
    
    public init(_ value: Value) {
        self.value = value
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}

extension EquatableValue: CustomStringConvertible where Value: CustomStringConvertible {
    var description: String {
        return value.description
    }
}
