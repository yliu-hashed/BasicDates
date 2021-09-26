import XCTest
@testable import BasicDates

final class BasicDatesTests: XCTestCase {
	func testToday() throws {
		let today = Calendar.current.startOfDay(for: Date())
		XCTAssertEqual(today, BasicDate.today.date)
	}
	func testMath() throws {
		let d1 = BasicDate(year: 2020, month: 1, day: 1)
		let d1_1 = d1.advancedBy(year: 0, month: 0, week: 0, day: -1)
		XCTAssertEqual(d1_1.array, [2019,12,31])
		let d1_2 = d1 + 1
		XCTAssertEqual(d1_2.array, [2020,1,2])
		let d1_3 = d1 - 1
		XCTAssertEqual(d1_3.array, [2019,12,31])
		var d1_4 = d1
		d1_4 += 1
		XCTAssertEqual(d1_4.array, [2020,1,2])
		d1_4 -= 2
		XCTAssertEqual(d1_4.array, [2019,12,31])
		let d2_1 = BasicDate(from: [2019,12,31])
		let d2_2 = BasicDate(from: [2020,1,1])
		XCTAssertEqual(d2_1 - d2_2, -1)
		XCTAssertEqual(d2_2 - d2_1, 1)
	}
	func testCompare() throws {
		let d1 = BasicDate(year: 2020, month: 1, day: 1)
		let d2 = BasicDate(year: 2019, month: 12, day: 31)
		XCTAssertTrue(d1 > d2)
		XCTAssertTrue(d2 < d1)
		XCTAssertTrue(d1 != d2)
		XCTAssertTrue(d1 == d2 + 1)
		let d3 = BasicDate(year: 2020, month: 2, day: 1)
		let d4 = BasicDate(year: 2020, month: 1, day: 31)
		XCTAssertTrue(d3 > d4)
		XCTAssertTrue(d4 < d3)
		XCTAssertTrue(d4 != d3)
		XCTAssertTrue(d4 == d3 - 1)
		let d5 = BasicDate(year: 2020, month: 1, day: 2)
		let d6 = BasicDate(year: 2020, month: 1, day: 1)
		XCTAssertTrue(d5 > d6)
		XCTAssertTrue(d6 < d5)
		XCTAssertTrue(d6 != d5)
		XCTAssertTrue(d6 == d5 - 1)
	}
	func testStartOfThings() throws {
		let d1 = BasicDate(year: 2021, month: 9, day: 23)
		XCTAssertEqual(d1.startOfMonth.array, [2021,9,1])
		XCTAssertEqual(d1.startOfYear.array, [2021,1,1])
	}
}
