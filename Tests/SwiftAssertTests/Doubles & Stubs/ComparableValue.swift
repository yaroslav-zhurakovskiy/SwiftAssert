struct ComparableValue<Value: Comparable>: Comparable {
    private let value: Value
    
    init(_ value: Value) {
        self.value = value
    }
}

extension ComparableValue {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func < (lhs: ComparableValue<Value>, rhs: ComparableValue<Value>) -> Bool {
        return lhs.value < rhs.value
    }
}

extension ComparableValue where Value: CustomStringConvertible {
    var description: String {
        return value.description
    }
}
