import XCTest

@available(iOS 9.0, *)
public class XCUIElementAssertion: AnyAssertion<XCUIElement> {
    
}

@available(iOS 9.0, *)
public extension XCUIElementAssertion {
    @discardableResult
    func exists(file: StaticString = #file, line: UInt = #line) -> Self {
        if !subject.exists {
            failure("Expected [\(subject.identifier)] to exist", file: file, line: line)
        }
        return self
    }
    
    @discardableResult
    func doesNotExist(file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.exists {
            failure("Expected [\(subject.identifier)] not to exist", file: file, line: line)
        }
        return self
    }
    
    
    @discardableResult
    func isEnabled(file: StaticString = #file, line: UInt = #line) -> Self {
        if !subject.isEnabled {
            failure("Expected [\(subject.identifier)] to be enabled", file: file, line: line)
        }
        return self
    }
    
    @discardableResult
    func isDisabled(file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.isEnabled {
            failure("Expected [\(subject.identifier)] to be disabled", file: file, line: line)
        }
        return self
    }
    
    @discardableResult
    func isSelected(file: StaticString = #file, line: UInt = #line) -> Self {
        if !subject.isSelected {
            failure("Expected [\(subject.identifier)] to be selected", file: file, line: line)
        }
        return self
    }
    
    @discardableResult
    func isNotSelected(file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.isSelected {
            failure("Expected [\(subject.identifier)] not to be selected", file: file, line: line)
        }
        return self
    }
    
    @discardableResult
    func isHittable(file: StaticString = #file, line: UInt = #line) -> Self {
        if !subject.isHittable {
            failure("Expected [\(subject.identifier)] to be hittable", file: file, line: line)
        }
        return self
    }
    
    @discardableResult
    func isNotHittable(file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.isHittable {
            failure("Expected [\(subject.identifier)] not to be hittable", file: file, line: line)
        }
        return self
    }
    
    @discardableResult
    func hasFrame(_ frame: CGRect, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.frame != frame {
            failure(
                """
                Expected [\(subject.identifier)] to have frame:
                    \(frame)
                but got:
                    \(subject.frame)
                """,
                file: file,
                line: line
            )
        }
        return self
    }
    
    @discardableResult
    func hasIdentifier(_ identifier: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.identifier != identifier {
            failure(
                """
                Expected element identifier to be:
                    \(identifier)
                but got:
                    \(subject.identifier)
                """,
                file: file,
                line: line
            )
        }
        return self
    }
    
    @discardableResult
    func hasLabel(_ label: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.label != label {
            failure(
                """
                Expected [\(subject.identifier)] label to be:
                    \(label)
                but got:
                    \(subject.label)
                """,
                file: file,
                line: line
            )
        }
        return self
    }
    
    @discardableResult
    func hasTitle(_ title: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.title != title {
            failure(
                """
                Expected [\(subject.identifier)] title to be:
                    \(title)
                but got:
                    \(subject.title)
                """,
                file: file,
                line: line
            )
        }
        return self
    }
    
    @discardableResult
    func hasPlaceholderValue(_ placeholderValue: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if let actualValue = subject.placeholderValue {
            if actualValue != placeholderValue {
                failure(
                    """
                    Expected [\(subject.identifier)] to have placeholder value:
                        \(placeholderValue)
                    but got:
                        \(actualValue)
                    """,
                    file: file,
                    line: line
                )
            }
        } else {
            failure(
                """
                Expected [\(subject.identifier)] to have placeholder value:
                    \(placeholderValue)
                but got nothing
                """,
                file: file,
                line: line
            )
        }
        return self
    }
    
    @discardableResult
    func doesNotHavePlaceholderValue(file: StaticString = #file, line: UInt = #line) -> Self {
        if let placeholderValue = subject.placeholderValue {
            failure(
                """
                Expected [\(subject.identifier)] not to have placeholder value, but got:
                    \(placeholderValue)
                """,
                file: file,
                line: line
            )
        }
        return self
    }
    
    @discardableResult
    func doesNotHaveValue(file: StaticString = #file, line: UInt = #line) -> Self {
        if let value = subject.value {
            failure(
                """
                Expected [\(subject.identifier)] not to have value, but got:
                    \(value)
                """,
                file: file,
                line: line
            )
        }
        return self
    }
    
    @discardableResult
    func hasValue(_ value: String, file: StaticString = #file, line: UInt = #line) -> Self {
        if let actualValue = subject.value {
            if let stringValue = actualValue as? String {
                if stringValue != value {
                    failure(
                        """
                        Expected [\(subject.identifier)] value to be:
                            \(value)
                        but got:
                            \(subject.value!)
                        """,
                        file: file,
                        line: line
                    )
                }
            } else {
                failure(
                    """
                    Expected [\(subject.identifier)] value to be:
                        \(value)
                    but got:
                        \(type(of: actualValue))
                    with value:
                        \(actualValue)
                    """,
                    file: file,
                    line: line
                )
            }
        } else {
            failure(
                """
                Expected [\(subject.identifier)] value to be:
                    \(value)
                but got nothing
                """,
                file: file,
                line: line
            )
        }
        return self
    }
    
    @discardableResult
    func hasElementType(_ elementType: XCUIElement.ElementType, file: StaticString = #file, line: UInt = #line) -> Self {
        if subject.elementType != elementType {
            failure(
                """
                Expected [ELEMENT ID] to have type:
                    \(XCUIElementTypeFormatter.shared.format(elementType))
                but got:
                    \(XCUIElementTypeFormatter.shared.format(subject.elementType))
                """,
                file: file,
                line: line
            )
        }
        return self
    }
}


@available(iOS 9.0, *)
public func assertThat(_ subject: XCUIElement) -> XCUIElementAssertion {
    return XCUIElementAssertion(subject: subject)
}
