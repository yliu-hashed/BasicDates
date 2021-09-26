[![Github release](https://img.shields.io/github/downloadsYuandaLiu-Hashed/BasicDates/total.svg)](https://github.com/YuandaLiu-Hashed/BasicDates/releases)
[![Github release](https://img.shields.io/github/repo-size/YuandaLiu-Hashed/BasicDates.svg?color=blue)](https://github.com/YuandaLiu-Hashed/BasicDates/releases)

# BasicDates (Swift)

```BasicDate``` is confusion and intuitive free timezone independent date representation structure in **Swift**. It include a structure called ```BasicDate``` and that's it no fancy stuff, just a simple structure. The ```BasicDate``` structure represent a single day and that's it, no timezone, no time even. It represent a day, no hour, no minute, just a simple date. 

Traditionally, storing a event at a specific day involves calculating the start of the event day, and storing it as ```Date```. But it is unreliable becuase if you move to a earlier timezone, event stored as tomorrow's will be displayed as it is today's. To medigate this problem, ```BasicDate``` is created. 

Fundimentally, a ```BasicDate``` is stored by three values, the year, month, and day as integers. The advantage of this system is that it is reliable and predictable. Due to its simplicity, it can be easily stored or retreved. It is also timezome independent, meaning a day is stored as a day. September 11th 2002 is stored as September 11th 2002. Solid like a rock. This also makes date creation easy.

# Installation
Only Swift Package Manager is supported.
```
https://github.com/YuandaLiu-Hashed/BasicDates.git
```
Xcode 12 & Below: ```File -> Swift Packages -> Add Package Dependency -> Paste in this link```

Xcode 13 & Above: ```File -> Add Packages -> Paste in this git link```

# Utilization
## Creating a ```BasicDate```
```Swift
init(year: Int, month: Int, day: Int)
```
= Initialize using three integers.

```Swift
init(date: Date)
```
Initialize using the system provided date.

```Swift
init(from array: [Int])
```
Initialize with a three element array.

```Swift
static var today: BasicDate { get }
```
Get today's Date.

### Examples
```Swift
let someDay1 = BasicDate(year: 2020, month: 3, day: 20)

let someDay2 = BasicDate(date: Date())

let dateArray = [2020, 3, 20]
let someDay3 = BasicDate(from: dateArray)

let today = BasicDate.today
```

## Converting Dates
```Swift
var array: [Int] { get }
```
An array of integers representing the date. 
```Swift
var dateComponents: DateComponents { get }
```
A system date component representing the date. 

```Swift
var date: Date { get }
```
A system date representing the date.

### Examples
An array of integers representing the date. 
```Swift
let someDay = BasicDate(year: 2020, month: 3, day: 20)
print(someDay.array)
//[2020,2,20]

print(someDay.dateComponents)
//calendar: gregorian (current) year: 2020 month: 3 day: 20 isLeapMonth: false

print(someDay.date)
//2020-03-20 04:00:00 +0000
```

## Getting Related Date
```Swift
var startOfYear: BasicDate { get }
var startOfMonth: BasicDate { get }
var startOfWeek: BasicDate { get }
```
Get the first day of the year, month, or week this date is in. 

## Calculating Date & Date Intervals
```Swift
func advancedBy(year: Int, month: Int, week: Int, day: Int) -> BasicDate
```
Returns a basic date offset the specified date component from this date.

```Swift
func distance(to: Basicdate) -> Int
```
Calculate the number of days until another date.

```Swift
static func + (BasicDate, Int) -> BasicDate
```
Returns a basic date with a specified amount of day added to it.

```Swift
static func - (BasicDate, Int) -> BasicDate
```
Returns a basic date with a specified amount of day removed from it.

```Swift
static func - (BasicDate, BasicDate) -> Int
```
Calculate the number of days required for one day to be another date.

```Swift
static func += (inout BasicDate, Int)
```
Adds a specific amount of day to a date.

```Swift
static func -= (inout BasicDate, Int)
```
Remove a specific amount of day to a date.

## Comparing Dates
```Swift
static func == (BasicDate, BasicDate) -> Bool
static func != (BasicDate, BasicDate) -> Bool
static func > (BasicDate, BasicDate) -> Bool
static func >= (BasicDate, BasicDate) -> Bool
static func < (BasicDate, BasicDate) -> Bool
static func <= (BasicDate, BasicDate) -> Bool
```
Compareing two different dates. (A later date is bigger)
