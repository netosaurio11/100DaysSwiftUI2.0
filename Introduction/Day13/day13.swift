import UIKit

// Variables and constants
var name: String = "Tim McGraw"
name = "Romeo"

let lastName: String = "Santos"

// Types of Data
var country: String
country = "México"

var year: Int
year = 1910


/// Float and Double
var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -123486.783333
longitude = -1234586.783333

var longitudeDouble: Double
longitudeDouble = -86.783333
longitudeDouble = -186.783333
longitudeDouble = -1286.783333
longitudeDouble = -123486.783333
longitudeDouble = -1234586.783333

/// Boolean
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat: Bool
missABeat = false


// Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 1

var doubleA: Double = 1.1
var doubleB: Double = 2.2
var doubleC = doubleA + doubleB

var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

// Comparison operators
var number1 = 1.1
var number2 = 2.2
var number3 = number1 + number2

number3 > 3
number3 >= 3
number3 > 4
number3 < 4

name1 == "Tim McGraw"

/// 'not' operator
var isSunnyDay = true
isSunnyDay
!isSunnyDay

// String Interporlation
var age = 24
print("You are \(age) years old. In another \(age) years will be \(age * 2)")

// Arrays
var evenNumbers: [Int] = [2, 4, 6, 8]
var songs: [String] = ["Shakeit Off", "You Belong with Me", "Back to December"]
songs[0]
songs[1]
songs[2]
type(of: songs)

var songsAny: [Any] = ["Shakeit Off", "You Belong with Me", "Back to December", 3]
/// Creating Arrays
var names: [String] = []
var namesB: [String] = ["Selena", "Julia"]
/// Array operators
var otherNames: [String] = ["George", "Saul"]
names = namesB + otherNames
names += ["Kim"]


// Dictionaries
var person: [String: String] = ["first": "Taylor", "middle": "Alisson", "last": "Swift", "month": "December", "website": "taylorswift.com"]
person["middle"]
person["month"]
