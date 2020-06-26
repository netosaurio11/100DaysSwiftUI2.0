import UIKit

// Writing functions
/// Swift functions start with func keyword

func printHelp() {
    let message: String = """
Welcometo everyone!

I Hope you're whaving a good day!
"""
    print(message)
}
printHelp()

// Accepting parameters and returning values
func square(number: Int) -> Int {
    return number * number
}
let resultSquare = square(number: 7)
print(resultSquare)

// Parameters Labels
/// Swift lets you use two names, one for use externally and another one for use internally
/// to - label to use externally
/// name - label to use internally
func sayHello(to name: String) {
    print("Hello, \(name)")
}

sayHello(to: "Neto")

// Omitting parameter labels
/// To make this you have to add _ in your external  parameter name
func greet(_ person: String) {
    print("Hellio, \(person)")
}
greet("Drake")

// Default parameters
func hello(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no! It's \(person) again... 😒")
    }
}
hello("Taylor") /// By the default value. outputs: Hello, Taylor!
hello("Taylor", nicely: false)

// Variadic functions
/// Fancy way of saying they accept any number of parameters
/// You can make any parameter variadic by writing: ... after its type
func squareVariadic(_ numbers: Int ...) {
    for number in numbers {
        print("\(number) sqaured is: \(number * number)")
    }
}
squareVariadic(1, 2, 3, 4, 5)

// Writing throwing functions
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
// Running throwing functions
do {
    try checkPassword("password") /// This won't be executed
    print("That password is good!")
} catch {
    print("You can't use that password")
}

// Inout parameters
/// This means that can be changed inside your function

func doubleInPlace(number: inout Int) {
    number *= number
}
var myNumber = 5
doubleInPlace(number: &myNumber)
print(myNumber) /// outputs: 25
