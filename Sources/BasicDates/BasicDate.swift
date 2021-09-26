import Foundation

public struct BasicDate {
	
	//MARK: Property & Initializers
	var year: Int
	var month: Int
	var day: Int
	
	/// Creates a basic date from year, month, and day components.
	/// - Parameters:
	///   - year: The year value of the date.
	///   - month: The month value of the date.
	///   - day: The day value of the date.
	init(year: Int, month: Int, day: Int) {
		self.year = year
		self.month = month
		self.day = day
	}
	
	/// Creates a basic date from system date type.
	/// - Parameter date: The system date used to create basic date.
	init(date: Date) {
		year = Calendar.current.component(.year, from: date)
		month = Calendar.current.component(.month, from: date)
		day = Calendar.current.component(.day, from: date)
	}
	
	/// Creates a basic date from a array of three values, arranged by [year, month, date].
	/// - Parameter array: The array used to create the basic date.
	init(from array: [Int]) {
		guard array.count == 3 else {
			year = 0
			month = 0
			day = 0
			return
		}
		
		year = array[0]
		month = array[1]
		day = array[2]
	}
	
	//MARK: Computed Properties
	
	/// A size three array of integer value representing this date, arranged as [year, month, day].
	var array: [Int] {
		return [year, month, day]
	}
	
	/// The system date component describing this date.
	var dateComponents: DateComponents {
		return DateComponents(calendar: Calendar.current,
							  year: year,
							  month: month,
							  day: day)
	}
	
	/// The system date describing this date.
	var date: Date {
		return Calendar.current.date(from: dateComponents)!
	}
	
	/// Today in basic date.
	static var today: BasicDate {
		return BasicDate(date: Date())
	}
	
	//MARK: Functions
	
	/// Returns a basic date offset the specified date component from this date.
	/// - Parameters:
	///   - year: The year offset.
	///   - month: The month offset.
	///   - week: The week offset.
	///   - day: The day offset.
	/// - Returns: A basic date offset the specified date component from this date.
	func advancedBy(year: Int = 0, month: Int = 0, week: Int = 0, day: Int = 0) -> BasicDate {
		let advancingDateComponent = DateComponents(calendar: Calendar.current,
													year: year,
													month: month,
													day: day + week * 7)
		
		
		let calculatedDate = Calendar.current.date(byAdding: advancingDateComponent, to: date)!
		return BasicDate(date: calculatedDate)
	}
	
	/// Calculate the number of days until another date.
	/// - Parameter x: The comparing date
	/// - Returns: Number of days as difference.
	func distance(to x: BasicDate) -> Int {
		return Calendar.current.dateComponents([.day], from: self.date, to: x.date).day ?? 0
	}
	
	/// The start of year of this date.
	var startOfYear: BasicDate {
		return BasicDate(year: year, month: 1, day: 1)
	}
	
	/// The start of month for this date.
	var startOfMonth: BasicDate {
		return BasicDate(year: year, month: month, day: 1)
	}
	
	/// The start of week for this date.
	var startOfWeek: BasicDate {
		let calculatedDate = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
		return BasicDate(date: calculatedDate)
	}
}

//MARK: Extensions
extension BasicDate: Equatable, Comparable {
	public static func < (lhs: BasicDate, rhs: BasicDate) -> Bool {
		if lhs.year != rhs.year {
			return lhs.year < rhs.year
		}
		if lhs.month != rhs.month {
			return lhs.month < rhs.month
		}
		if lhs.day != rhs.day {
			return lhs.day < rhs.day
		}
		return false
	}
	
	public static func + (lhs: BasicDate, rhs: Int) -> BasicDate {
		return lhs.advancedBy(day: rhs)
	}
	
	public static func - (lhs: BasicDate, rhs: Int) -> BasicDate {
		return lhs.advancedBy(day: -rhs)
	}
	
	public static func - (lhs: BasicDate, rhs: BasicDate) -> Int {
		return -lhs.distance(to: rhs)
	}
	
	public static func += (lhs: inout BasicDate, rhs: Int) {
		lhs = lhs.advancedBy(day: rhs)
	}
	
	public static func -= (lhs: inout BasicDate, rhs: Int) {
		lhs = lhs.advancedBy(day: -rhs)
	}
}
