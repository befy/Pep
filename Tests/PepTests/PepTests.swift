import XCTest
@testable import Pep

final class PepTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Pep().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
