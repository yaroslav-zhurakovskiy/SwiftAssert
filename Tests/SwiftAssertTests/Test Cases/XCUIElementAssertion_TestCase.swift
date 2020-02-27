//
//  Created by Yaroslav Zhurakovskiy on 27.02.2020.
//

import SwiftAssert
import XCTest
import ObjectiveC

@available(iOS 9.0, *)
class XCUIElementAssertionTestCase: AssertionTestCase {
    fileprivate private(set) var element: XCUIElementStub!
    
    override func setUp() {
        super.setUp()
        
        element = XCUIElementStub.create()
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_Exists_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementExists_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.exists), with: { true })
        
        assertThat(element).exists()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhneElementDoesNotExist_ShouldReportFailuire() {
        element.stub(selector: #selector(getter: XCUIElement.exists), with: { false })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element).exists()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [ELEMENT ID] to exist", at: location)
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_DoesNotExist_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementDoesNotExist_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.exists), with: { false })
        
        assertThat(element).doesNotExist()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenElementExists_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.exists), with: { true })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element).doesNotExist()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [ELEMENT ID] not to exist", at: location)
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_IsEnabled_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementIsEnabled_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isEnabled), with: { true })
        
        assertThat(element!).isEnabled()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenElementIsDisabled_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isEnabled), with: { false })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).isEnabled()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [ELEMENT ID] to be enabled", at: location)
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_IsDisabled_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementIsDisabled_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isEnabled), with: { false })
        
        assertThat(element!).isDisabled()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenElementIsEnabled_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isEnabled), with: { true })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).isDisabled()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [ELEMENT ID] to be disabled", at: location)
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_IsSelected_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementIsSelected_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isSelected), with: { true })
        
        assertThat(element!).isSelected()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenElementIsUnselected_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isSelected), with: { false })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).isSelected()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [ELEMENT ID] to be selected", at: location)
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_IsUnselected_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementIsSelected_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isSelected), with: { false })
        
        assertThat(element!).isNotSelected()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenElementIsUnselected_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isSelected), with: { true })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).isNotSelected()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [ELEMENT ID] not to be selected", at: location)
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_IsHittable_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementIsHittable_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isHittable), with: { true })
        
        assertThat(element!).isHittable()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenElementIsUnhittable_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isHittable), with: { false })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).isHittable()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [ELEMENT ID] to be hittable", at: location)
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_IsUnhittable_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementIsUnhittable_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isHittable), with: { false })
        
        assertThat(element!).isNotHittable()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenElementIsHittable_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.isHittable), with: { true })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).isNotHittable()
        
        reporterMock.assertOneReportedFailure(withText: "Expected [ELEMENT ID] not to be hittable", at: location)
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_HasFrame_TestCase: XCUIElementAssertionTestCase {
    func test_WhenFramesMatch_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.frame), with: { .zero })
        
        assertThat(element!).hasFrame(.zero)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenFramesDontMatch_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.frame), with: { CGRect(x: 10, y: 10, width: 10, height: 10) })
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasFrame(.zero)
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] to have frame:
                \(CGRect.zero)
            but got:
                \(CGRect(x: 10, y: 10, width: 10, height: 10))
            """,
            at: location
        )
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_HasIdentifier_TestCase: XCUIElementAssertionTestCase {
    func test_WhenIDsMatch_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ID" })
        
        assertThat(element!).hasIdentifier("ID")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenIDsDoNotMatch_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "WRONG ID" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasIdentifier("ID")
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected element identifier to be:
                ID
            but got:
                WRONG ID
            """,
            at: location
        )
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_HasLabel_TestCase: XCUIElementAssertionTestCase {
    func test_WhenLabelsMatch_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.label), with: { "LABEL" })
        
        assertThat(element!).hasLabel("LABEL")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenLabelsDoNotMatch_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: #selector(getter: XCUIElement.label), with: { "WRONG LABEL" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasLabel("LABEL")
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] label to be:
                LABEL
            but got:
                WRONG LABEL
            """,
            at: location
        )
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_HasTitle_TestCase: XCUIElementAssertionTestCase {
    func test_WhenTitlesMatch_ShouldNotReportAnyFailure() {
        element.stub(selector: #selector(getter: XCUIElement.title), with: { "TITLE" })
        
        assertThat(element!).hasTitle("TITLE")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenTitlesDoNotMatch_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: #selector(getter: XCUIElement.title), with: { "WRONG TITLE" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasTitle("TITLE")
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] title to be:
                TITLE
            but got:
                WRONG TITLE
            """,
            at: location
        )
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_HasValue_TestCase: XCUIElementAssertionTestCase {
    let valueSelector = #selector(getter: XCUIElementAttributes.value)
    
    func test_WhenValuesMatch_ShouldNotReportAnyFailure() {
        element.stub(selector: valueSelector, with: { "VALUE" })
        
        assertThat(element!).hasValue("VALUE")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenValueIsMissing_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: valueSelector, with: { Optional<String>.none })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasValue("VALUE")
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] value to be:
                VALUE
            but got nothing
            """,
            at: location
        )
    }
    
    func test_WhenValueIsNotAString_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: valueSelector, with: { Optional<NSNumber>.some(0) })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasValue("VALUE")
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] value to be:
                VALUE
            but got:
                __NSCFNumber
            with value:
                0
            """,
            at: location
        )
    }
    
    func test_WhenValuesDoNotMatch_ShouldReportFailure() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: valueSelector, with: { "WRONG VALUE" })

        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasValue("VALUE")

        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] value to be:
                VALUE
            but got:
                WRONG VALUE
            """,
            at: location
        )
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_DoesNotHasValue_TestCase: XCUIElementAssertionTestCase {
    func test_WhenDoesNotHaveValue_ShouldNotReportAnyFailuire() {
        element.stub(selector: #selector(getter: XCUIElementAttributes.value), with: { String?.none })
        
        assertThat(element!).doesNotHaveValue()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenHasValue_ShouldReportFailuire() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: #selector(getter: XCUIElementAttributes.value), with: { "WRONG VALUE" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).doesNotHaveValue()
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] not to have value, but got:
                WRONG VALUE
            """,
            at: location
        )
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_HasPlaceholderValue_TestCase: XCUIElementAssertionTestCase {
    func test_WhenPlaceholderValuesMatch_ShouldNotReportAnyFailuire() {
        element.stub(selector: #selector(getter: XCUIElementAttributes.placeholderValue), with: { "PLACEHOLDER" })
        
        assertThat(element!).hasPlaceholderValue("PLACEHOLDER")
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenDoesNotHavePlaceholderValue_ShouldReportFailuire() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: #selector(getter: XCUIElementAttributes.placeholderValue), with: { String?.none })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasPlaceholderValue("PLACEHOLDER")
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] to have placeholder value:
                PLACEHOLDER
            but got nothing
            """,
            at: location
        )
    }
    
    func testPlaceholderValuesDoNotMatch_ShouldReportFailuire() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: #selector(getter: XCUIElementAttributes.placeholderValue), with: { "WRONG PLACEHOLDER" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasPlaceholderValue("PLACEHOLDER")
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] to have placeholder value:
                PLACEHOLDER
            but got:
                WRONG PLACEHOLDER
            """,
            at: location
        )
    }
}


@available(iOS 9.0, *)
class XCUIElementAssertion_DoesNotHasPlaceholderValue_TestCase: XCUIElementAssertionTestCase {
    func test_WhenDoesNotHavePlaceholderValue_ShouldNotReportAnyFailuire() {
        element.stub(selector: #selector(getter: XCUIElementAttributes.placeholderValue), with: { String?.none })
        
        assertThat(element!).doesNotHavePlaceholderValue()
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenHasPlaceholderValue_ShouldReportFailuire() {
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: #selector(getter: XCUIElementAttributes.placeholderValue), with: { "WRONG VALUE" })
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).doesNotHavePlaceholderValue()
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] not to have placeholder value, but got:
                WRONG VALUE
            """,
            at: location
        )
    }
}

@available(iOS 9.0, *)
class XCUIElementAssertion_ElementType_TestCase: XCUIElementAssertionTestCase {
    func test_WhenElementTypesMatch_ShouldNotReportFailure() {
        element.stub(selector: #selector(getter: XCUIElementAttributes.elementType), with: { .alert })
        
        assertThat(element!).hasElementType(.alert)
        
        reporterMock.assertNoReportedFailures()
    }
    
    func test_WhenValueTypesDoNotMatch_ShouldReportFailure() {
        let formatterMock = XCUIElementTypeFormatterMock()
        XCUIElementTypeFormatter.shared = formatterMock
        addTeardownBlock { XCUIElementTypeFormatterMock.shared = formatterMock }
        element.stub(selector: #selector(getter: XCUIElement.identifier), with: { "ELEMENT ID" })
        element.stub(selector: #selector(getter: XCUIElementAttributes.elementType), with: { .textField })
        formatterMock.stubFormat(withResult: "FORMATED(secureTextField)", for: .secureTextField)
        formatterMock.stubFormat(withResult: "FORMATED(textField)", for: .textField)
        
        let location = createSourceLocationInThisFileAtTheNextLine()
        assertThat(element!).hasElementType(.secureTextField)
        
        reporterMock.assertOneReportedFailure(
            withText: """
            Expected [ELEMENT ID] to have type:
                FORMATED(secureTextField)
            but got:
                FORMATED(textField)
            """,
            at: location
        )
    }
}

protocol NSObjectStubTrait: NSObject {
    
}

extension NSObjectStubTrait {
    func stub(selector: Selector, with impl: @escaping @convention (c) () -> String) {
        let method = class_getInstanceMethod(type(of: self), selector)!
        method_setImplementation(method, unsafeBitCast(impl, to: IMP.self))
    }
    
    func stub(_ keyPath: KeyPath<Self, Bool>, with impl: @escaping @convention(c) () -> ObjCBool) {
        let selector = Selector(NSExpression(forKeyPath: keyPath).keyPath)
        stub(selector: selector, with: impl)
    }

    func stub(selector: Selector, with impl: @escaping @convention (c) () -> ObjCBool) {
        let method = class_getInstanceMethod(type(of: self), selector)!
        method_setImplementation(method, unsafeBitCast(impl, to: IMP.self))
    }

    func stub(selector: Selector, with impl: @escaping @convention (c) () -> CGRect) {
        let method = class_getInstanceMethod(type(of: self), selector)!
        method_setImplementation(method, unsafeBitCast(impl, to: IMP.self))
    }
    
    func stub(selector: Selector, with impl: @escaping @convention (c) () -> Optional<String>) {
        let method = class_getInstanceMethod(type(of: self), selector)!
        method_setImplementation(method, unsafeBitCast(impl, to: IMP.self))
    }
    
    func stub(selector: Selector, with impl: @escaping @convention (c) () -> Optional<NSNumber>) {
        let method = class_getInstanceMethod(type(of: self), selector)!
        method_setImplementation(method, unsafeBitCast(impl, to: IMP.self))
    }
}

@available(iOS 9.0, *)
@objc (XCUIElementStub)
class XCUIElementStub: XCUIElement, NSObjectStubTrait {
    static func create(configure: (XCUIElementStub) -> Void = { _ in }) -> XCUIElementStub {
        let klass: AnyClass = NSClassFromString("XCUIElementStub")!
        let instance = (klass as AnyObject).perform(Selector("new"))!.takeRetainedValue()
        let element = instance as! XCUIElementStub
        configure(element)
        return element
    }
    
    func stub(selector: Selector, with impl: @escaping @convention (c) () -> XCUIElement.ElementType) {
        let method = class_getInstanceMethod(type(of: self), selector)!
        method_setImplementation(method, unsafeBitCast(impl, to: IMP.self))
    }
}
