import UIKit

// Creating basic closures
let driving = {
    print("I'm driving in my car")
}
driving()

// Accepting parameters in a closure
let drivingTo = { (place: String) in
    print("I'm driving to \(place)")
}
drivingTo("México") /// In closures you don't use parameters labels

//Returning values from a closure
let drivingWithReturn = { (place: String) -> String in
    return "I'm driving to \(place) in my car."
}
let message: String = drivingWithReturn("Argentina")
print(message)

// Closures as parameters
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I've arrived!")
}
travel(action: driving)

// Trailing closure syntax
travel {
    print("I'm driving in my car. (With trailing closure syntax :p)")
}
