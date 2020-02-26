//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

public class SetAssertion<Element: Hashable>: AnyAssertion<Set<Element>> {
    @discardableResult
    public func hasCapacity(_ capacity: Int, file: StaticString = #file, line: UInt = #line) -> Self {
        assertThat(subject.capacity).isEqualTo(capacity, file: file, line: line)
        return self
    }
}

public func assertThat<Element: Hashable>(_ subject: Set<Element>) -> SetAssertion<Element> {
    return SetAssertion(subject: subject)
}
