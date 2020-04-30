import UIKit

// Arithmetic operators
let firstScore = 12
let secondScore = 4

// Adding and substracting
let total = firstScore + secondScore /// output: 16
let difference = firstScore - secondScore /// output: 8

// Multiplying and dividing
let product = firstScore * secondScore /// output: 48
let divided = firstScore / secondScore /// output: 3

// Remainders after division
/// It calculates how many times one number can fit inside another
let remainder = 13 % secondScore /// output: 1

// Operator overloading
/// Swift is a type-safe language, which means it won’t let you mix types.

/// Sums integers
let meaningOfLife = 42
let doubleMeaning = 42 + 42 /// output: 84

/// Joins strings
let fakers = "Fakers gonna "
let action = fakers + "fake" /// output: "Fakers gonna fake"

/// Join Arrays
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf /// output:  ["John", "Paul", "George", "Ringo"]

// Compound assignment operators
/// You can change a variable in place
/// +=, -=, *= and /=

var score = 95
score -= 5 /// outputs: 90

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards" /// output: "The rain in Spain falls mainly on the Spaniards"

// Comparison operators
let scoreOne = 6
let scoreTwo = 4

/// Equals
scoreOne == scoreTwo /// output: false
/// Not equals
scoreOne != scoreTwo /// output: true
/// Greater than
scoreOne > scoreTwo /// output: true
/// Less than
scoreOne < scoreTwo /// output: false
/// Greater or equal than
scoreOne >= scoreTwo /// output true
/// Less or equal than
scoreOne <= scoreTwo /// output: false
/// Each of these also work with strings, because strings have a natural alphabetical order
"Taylor" <= "Swift" /// output: false

// Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces - lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!") /// output: "Blackjack!"
} else {
    print("Regular cards")
}

// Combining conditions
/// and (&&) - or (||)
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18") /// will only happen if both ages are over 18
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18") /// output: ""At least one is over 18""
}

// The ternary operator
/// It works with three values at once
/// condition ? return value true : return value false
let cardOne = 11
let cardTwo = 10
print(cardOne == cardTwo ? "Cards are the same" : "Cards are different") /// output: "Cards are different"

// Switch statements
/// default – Is required because Swift makes sure you cover all possible cases
/// fallthrough - If you want execution to continue on to the next case
let weather = "sunny"

switch weather {
    case "rain":
        print("Bring an umbrella")
    case "snow":
        print("Wrap up warm")
    case "sunny":
        print("Wear sunscreen") /// output: "Wear sunscreen"
    fallthrough
    default:
        print("Enjoy your day!") /// output: "Enjoy your day!"
}

// Range operators
/// ..<, creates ranges up to but excluding the final value
/// ..., creates ranges up to and including the final value.
let points = 85

switch points {
case 0 ..< 50:
    print("You failed badly.")
case 50 ..< 85:
    print("You did OK.")
default:
    print("You did great!")
}
