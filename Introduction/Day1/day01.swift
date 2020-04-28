import UIKit

// Strings and integers
var str: String = "Hello, playground"
str = "Goodbye"
var age:Int = 38
var population: Int = 8_000_000

// Multi-line strings
var str1: String = """
This goes
over multiple
lines
"""
/// output:  "This goes\nover multiple\nlines"

var str2: String = """
This goes \
over multiple \
lines
"""
/// output: "This goes over multiple lines"

// Doubles and booleans
var pi = 3.141
print(type(of: pi)) /// output: Double

var awesome = true
print(type(of: awesome)) /// output: Bool

// String interpolation
var score: Int = 85
var interpolationStr: String = "Your score was \(score)" /// output:  Your score was 85
var results: String = "The test results are here: \(interpolationStr)" /// output: The test results are here: Your score was 85

// Constants
let taylor = "swift"

// Type annotations
/// var str = "Hello" - type inference
/// var str: String = "Hello" - type annotation
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true
