import XCTest

import ExampleTests
import SwiftAssertTests

var tests = [XCTestCaseEntry]()
tests += ExampleTests.__allTests()
tests += SwiftAssertTests.__allTests()

XCTMain(tests)
