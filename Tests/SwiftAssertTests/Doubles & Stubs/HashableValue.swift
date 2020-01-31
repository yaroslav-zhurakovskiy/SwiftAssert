struct HashableValue<Value: Hashable>: Hashable {
    private let value: Value
    
    init(_ value: Value) {
        self.value = value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

extension HashableValue: CustomStringConvertible where Value: CustomStringConvertible {
    var description: String {
        return value.description
    }
}
