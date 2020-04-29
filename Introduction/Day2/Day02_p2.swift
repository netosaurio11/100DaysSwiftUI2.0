import UIKit

// Dictionaries
/// Type Annotation: [String: Double], [String: String], etc.
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
] /// ["Ed Sheeran": 1.73, "Taylor Swift": 1.78]
heights["Taylor Swift"] /// output: 1.78

// Dictionary default values
/// If you try to read a value from a dictionary using a key that doesn’t exist, Swift will send you back nil
/// We can provide the dictionary with a default value to use if we request a missing key.

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"] /// output: "Chocolate"
favoriteIceCream["Charlotte"] /// output: nil
favoriteIceCream["Charlotte", default: "Unknown"] /// output "Unknown"

// Create empty collections
/// Arrays, sets, and dictionaries are called collections, because they collect values together in one place.
var teams = [String: String]()
teams["Paul"] = "Red"
var results1 = [Int]()
var words = Set<String>()
var numbers = Set<Int>()
var scores = Dictionary<String, Int>()
var results2 = Array<Int>()
