public struct FailureReporterHolder {
    public static var sharedReporter: FailureReporter = XCTestFailureReporter(testCase: nil)
}
