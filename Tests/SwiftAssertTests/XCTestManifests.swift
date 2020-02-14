#if !canImport(ObjectiveC)
import XCTest

extension ComparableAssertion_FluentStyle_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ComparableAssertion_FluentStyle_TestCase = [
        ("test_ShouldSupportFluentStyle", test_ShouldSupportFluentStyle),
    ]
}

extension ComparableAssertion_IsInClosedRange_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ComparableAssertion_IsInClosedRange_TestCase = [
        ("test_WhenInBounds_ShouldNotReportFailure", test_WhenInBounds_ShouldNotReportFailure),
        ("test_WhenIsOutsideOfBounds_ShouldReportFailure", test_WhenIsOutsideOfBounds_ShouldReportFailure),
    ]
}

extension ComparableAssertion_IsInRange_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ComparableAssertion_IsInRange_TestCase = [
        ("test_WhenInRange_ShouldNotReportFailure", test_WhenInRange_ShouldNotReportFailure),
        ("test_WhenIsOutsideOfBounds_ShouldReportFailure", test_WhenIsOutsideOfBounds_ShouldReportFailure),
    ]
}

extension ComparableAssetion_IsGreaterThanOrEqualTo_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ComparableAssetion_IsGreaterThanOrEqualTo_TestCase = [
        ("test_WhenSubjectAndValueAreEqual_ShouldNotReportFailure", test_WhenSubjectAndValueAreEqual_ShouldNotReportFailure),
        ("test_WhenSubjectIsGreater_ShouldNotReportFailure", test_WhenSubjectIsGreater_ShouldNotReportFailure),
        ("test_WhenSubjectIsLess_ShouldReportFailure", test_WhenSubjectIsLess_ShouldReportFailure),
    ]
}

extension ComparableAssetion_IsGreaterThan_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ComparableAssetion_IsGreaterThan_TestCase = [
        ("test_ShouldNotReportFailure_WhenSubjectIsGreater", test_ShouldNotReportFailure_WhenSubjectIsGreater),
        ("test_ShouldReportFailure_WhenSubjectIsEqual", test_ShouldReportFailure_WhenSubjectIsEqual),
        ("test_ShouldReportFailure_WhenSubjectIsLess", test_ShouldReportFailure_WhenSubjectIsLess),
    ]
}

extension ComparableAssetion_IsLessThanOrEqualTo_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ComparableAssetion_IsLessThanOrEqualTo_TestCase = [
        ("test_ShouldNotReportFailure_WhenSubjectIsEqualTo", test_ShouldNotReportFailure_WhenSubjectIsEqualTo),
        ("test_ShouldNotReportFailure_WhenSubjectIsLess", test_ShouldNotReportFailure_WhenSubjectIsLess),
        ("test_ShouldReportFailure_WhenSubjectIsGreater", test_ShouldReportFailure_WhenSubjectIsGreater),
    ]
}

extension ComparableAssetion_IsLessThan_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ComparableAssetion_IsLessThan_TestCase = [
        ("test_ShouldNotReportFailure_WhenSubjectIsLess", test_ShouldNotReportFailure_WhenSubjectIsLess),
        ("test_ShouldReportFailure_WhenSubjectIsEqual", test_ShouldReportFailure_WhenSubjectIsEqual),
        ("test_ShouldReportFailure_WhenSubjectIsGreater", test_ShouldReportFailure_WhenSubjectIsGreater),
    ]
}

extension EquatableAssetion_FluentStyle_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__EquatableAssetion_FluentStyle_TestCase = [
        ("test_ShouldSupportFluentStyle", test_ShouldSupportFluentStyle),
    ]
}

extension EquatableAssetion_IsEqualTo_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__EquatableAssetion_IsEqualTo_TestCase = [
        ("test_ShouldSupportFluentStyle", test_ShouldSupportFluentStyle),
        ("test_WhenValuesAreEqual_ShouldNotRecordAnyFailure", test_WhenValuesAreEqual_ShouldNotRecordAnyFailure),
        ("test_WhenValuesAreNotEqual_ShouldRecordFailure", test_WhenValuesAreNotEqual_ShouldRecordFailure),
    ]
}

extension EquatableAssetion_IsNotEqualTo_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__EquatableAssetion_IsNotEqualTo_TestCase = [
        ("test_ShouldSupportFluentStyle", test_ShouldSupportFluentStyle),
        ("test_WhenValuesAreEqual_ShouldReportFailure", test_WhenValuesAreEqual_ShouldReportFailure),
        ("test_WhenValuesAreNotEqual_ShouldNotReportAnyFailure", test_WhenValuesAreNotEqual_ShouldNotReportAnyFailure),
    ]
}

extension HashableAssertion_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__HashableAssertion_TestCase = [
        ("test_ShouldSupportFluentSyntax", test_ShouldSupportFluentSyntax),
        ("test_WhenHashValuesDontMatch_ShouldReportFailure", test_WhenHashValuesDontMatch_ShouldReportFailure),
        ("test_WhenHashValuesMatch_ShouldNotReportFailure", test_WhenHashValuesMatch_ShouldNotReportFailure),
    ]
}

extension OptionalAssertion_CheckingIfValueIsNil_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__OptionalAssertion_CheckingIfValueIsNil_TestCase = [
        ("test_ShouldNotReporFailure_WhenValueIsNil", test_ShouldNotReporFailure_WhenValueIsNil),
        ("test_ShouldReportFailure_WhenValueIsNotNil", test_ShouldReportFailure_WhenValueIsNotNil),
    ]
}

extension OptionalAssertion_CheckingIfValueIsNotNilAndPerformingOtherAssertion_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__OptionalAssertion_CheckingIfValueIsNotNilAndPerformingOtherAssertion_TestCase = [
        ("test_shouldAssertOnWrappedType_WhenValueIsNotNil", test_shouldAssertOnWrappedType_WhenValueIsNotNil),
        ("test_ShouldReportFaliure_WhenValueIsNil", test_ShouldReportFaliure_WhenValueIsNil),
    ]
}

extension OptionalAssertion_CheckingIfValueIsNotNil_TestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__OptionalAssertion_CheckingIfValueIsNotNil_TestCase = [
        ("test_ShouldNotReportFaliure_WhenValueIsNotNil", test_ShouldNotReportFaliure_WhenValueIsNotNil),
        ("test_ShouldReportFaliure_WhenValueIsNil", test_ShouldReportFaliure_WhenValueIsNil),
    ]
}

extension XCTestFailureReporterTestCase {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__XCTestFailureReporterTestCase = [
        ("testShouldBeTheDefaultReporter", testShouldBeTheDefaultReporter),
        ("testShouldRecordOneFailure", testShouldRecordOneFailure),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ComparableAssertion_FluentStyle_TestCase.__allTests__ComparableAssertion_FluentStyle_TestCase),
        testCase(ComparableAssertion_IsInClosedRange_TestCase.__allTests__ComparableAssertion_IsInClosedRange_TestCase),
        testCase(ComparableAssertion_IsInRange_TestCase.__allTests__ComparableAssertion_IsInRange_TestCase),
        testCase(ComparableAssetion_IsGreaterThanOrEqualTo_TestCase.__allTests__ComparableAssetion_IsGreaterThanOrEqualTo_TestCase),
        testCase(ComparableAssetion_IsGreaterThan_TestCase.__allTests__ComparableAssetion_IsGreaterThan_TestCase),
        testCase(ComparableAssetion_IsLessThanOrEqualTo_TestCase.__allTests__ComparableAssetion_IsLessThanOrEqualTo_TestCase),
        testCase(ComparableAssetion_IsLessThan_TestCase.__allTests__ComparableAssetion_IsLessThan_TestCase),
        testCase(EquatableAssetion_FluentStyle_TestCase.__allTests__EquatableAssetion_FluentStyle_TestCase),
        testCase(EquatableAssetion_IsEqualTo_TestCase.__allTests__EquatableAssetion_IsEqualTo_TestCase),
        testCase(EquatableAssetion_IsNotEqualTo_TestCase.__allTests__EquatableAssetion_IsNotEqualTo_TestCase),
        testCase(HashableAssertion_TestCase.__allTests__HashableAssertion_TestCase),
        testCase(OptionalAssertion_CheckingIfValueIsNil_TestCase.__allTests__OptionalAssertion_CheckingIfValueIsNil_TestCase),
        testCase(OptionalAssertion_CheckingIfValueIsNotNilAndPerformingOtherAssertion_TestCase.__allTests__OptionalAssertion_CheckingIfValueIsNotNilAndPerformingOtherAssertion_TestCase),
        testCase(OptionalAssertion_CheckingIfValueIsNotNil_TestCase.__allTests__OptionalAssertion_CheckingIfValueIsNotNil_TestCase),
        testCase(XCTestFailureReporterTestCase.__allTests__XCTestFailureReporterTestCase),
    ]
}
#endif