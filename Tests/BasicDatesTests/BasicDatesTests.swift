import XCTest
@testable import BasicDates

final class BasicDatesTests: XCTestCase {
	func testExample() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.
		XCTAssertEqual(BasicDate(year: 2020, month: 1, day: 1).startOfMonth, BasicDate(year: 2020, month: 1, day: 1))
	}
}
