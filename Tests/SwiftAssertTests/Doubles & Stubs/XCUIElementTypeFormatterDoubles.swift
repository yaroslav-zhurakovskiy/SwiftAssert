//
//  Created by Yaroslav Zhurakovskiy on 27.02.2020.
//

@testable import SwiftAssert
import XCTest

@available(iOS 9.0, *)
class XCUIElementTypeFormatterStub: XCUIElementTypeFormatter {
    private var formatStub: String?
    private var formatStubDict: [XCUIElement.ElementType: String] = [:]
    
    func stubFormat(withResult result: String) {
        formatStub = result
    }
    
    func stubFormat(withResult result: String, for elementType: XCUIElement.ElementType) {
        formatStubDict[elementType] = result
    }
    
    override func format(_ element: XCUIElement.ElementType) -> String {
        if let value = formatStub {
            return value
        } else if let value = formatStubDict[element] {
            return value
        } else {
            return super.format(element)
        }

    }
}

@available(iOS 9.0, *)
class XCUIElementTypeFormatterSpy: XCUIElementTypeFormatterStub {
    private(set) var formatCalls: [XCUIElement.ElementType] = []
   
    override func format(_ element: XCUIElement.ElementType) -> String {
        formatCalls.append(element)
        return super.format(element)
    }
}


@available(iOS 9.0, *)
class XCUIElementTypeFormatterMock: XCUIElementTypeFormatterSpy {
    func assertOneRecordedFormatCall(
        with element: XCUIElement.ElementType,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(formatCalls.count, 1, "Number of times format was called", file: file, line: line)
        XCTAssertEqual(formatCalls[0], element, "Formatted element type")
    }
}
