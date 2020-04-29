import UIKit

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

/// Type annotation for arrays: [String], [Int], [Double], and [Bool]
let beatles = [john, paul, george, ringo] // ["John Lennon", "Paul McCartney", "George Harrison", "Ringo Starr"]
beatles[1] /// output: Paul McCartney

// Sets
/// Sets are collections of values just like arrays, except they have two differences:
/// 1. Items aren’t stored in any order; they are stored in what is effectively a random order.
/// 2. No item can appear twice in a set; all items must be unique.

let colors = Set(["red", "green", "blue"]) /// output: random output.
let colors2 = Set(["red", "green", "blue", "red", "blue"]) /// only includes red, green and blue

// Tuples
/// 1.  You can’t add or remove items from a tuple; they are fixed in size.
/// 2.  You can’t change the type of items in a tuple
/// 3.  You can access items in a tuple using numerical positions or by naming them

var name = (first: "Taylor", last: "Swift")
name.0 /// or name.first - outputs: "Taylor"
name.last /// or name.1 - outputs "Swift"

// Arrays vs Sets vs Tuples
/// specific, fixed collection of related value - Tuples
/// collection of values that must be unique - Set
/// collection of values that can contain duplicates, or the order of your items matters - Array

let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
let set = Set(["aardvark", "astronaut", "azalea"])
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
