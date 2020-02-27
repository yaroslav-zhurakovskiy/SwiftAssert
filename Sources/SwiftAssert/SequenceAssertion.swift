//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//

public extension Assertion where Subject: Sequence, Subject.Element: Equatable {
    @discardableResult
    func contains(_ element: Subject.Element, file: StaticString = #file, line: UInt = #line) -> Self  {
        if !subject.contains(element) {
            let failure = Failure(
                text: "Expected \(subject.map { $0 }) to contain \(element)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func contains<Elements: Sequence>(
        _ elements: Elements,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self where Elements.Element == Subject.Element  {
        let diff = createDiff(from: AnySequence(subject), basedOn: AnySequence(elements))
        if diff.count > 0 {
            let failure = Failure(
                text: "Expected \(subject.map { $0 })\nTo Contain: \(elements.map { $0 })\nMissing: \(diff)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    // TODO: Move out
    private func createDiff<Element: Equatable>(from list: AnySequence<Element>, basedOn valuesToFind: AnySequence<Element>) -> [Element] {
        var diff = [Element]()
        for value in valuesToFind {
            if !list.contains(value) && !diff.contains(value) {
                diff.append(value)
            }
        }
        return diff
    }
    
    @discardableResult
    func isSorted(
        by areInIncreasingOrder: (Subject.Element, Subject.Element) -> Bool,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self  {
        if !subject.elementsEqual(subject.sorted(by: areInIncreasingOrder)) {
            let failure = Failure(
                text: "Expected \(subject.map { $0 }) to be sorted",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func starts<PossiblePrefix: Sequence>(
        with sequence: PossiblePrefix,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Self where PossiblePrefix.Element == Subject.Element {
        if !subject.starts(with: sequence) {
            let failure = Failure(
                text: "Expected \(subject.map { $0 }) to start with \(sequence.map { $0 })",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}

public extension Assertion where Subject: Sequence, Subject.Element: Comparable {
    @discardableResult
    func isSorted(file: StaticString = #file, line: UInt = #line) -> Self  {
        if !subject.elementsEqual(subject.sorted()) {
            let failure = Failure(
                text: "Expected \(subject.map { $0 }) to be sorted",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func hasMax(_ element: Subject.Element, file: StaticString = #file, line: UInt = #line) -> Self  {
        if let max = subject.max() {
            if max != element {
                let failure = Failure(
                    text: "Expected max element of \(subject.map { $0 }) to be \(element)",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        } else {
            let failure = Failure(
                text: "Expected max element of [] to be \(element)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
    
    @discardableResult
    func hasMin(_ element: Subject.Element, file: StaticString = #file, line: UInt = #line) -> Self  {
        if let max = subject.min() {
            if max != element {
                let failure = Failure(
                    text: "Expected min element of \(subject.map { $0 }) to be \(element)",
                    location: SourceLocation(filePath: file, line: line)
                )
                FailureReporterHolder.sharedReporter.reportFailure(failure)
            }
        } else {
            let failure = Failure(
                text: "Expected min element of [] to be \(element)",
                location: SourceLocation(filePath: file, line: line)
            )
            FailureReporterHolder.sharedReporter.reportFailure(failure)
        }
        return self
    }
}
