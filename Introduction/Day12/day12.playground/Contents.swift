import UIKit

// MARK: Optionales

var age: Int? = nil
age = 38

// Unwrapping optionals
var name: String? = nil

if let unwrapped: String = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// Wrapping with guard
func greet(_ name: String?) {
    guard let unwrapped: String = name else {
        print("Youdidn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)")
}

// Force unwrapping
let str = "5"
let num = Int(str)

let str2 = "6"
let num2 = Int(str2)!

// Implicity unwrapped optionals
var year: Int! = nil
year = Int("1997")

// Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 2) ?? "Anonymus" /// nil coalescing gives us a default value

// Optional chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased() /// Optionals chaining ignores the line if the first item is optional

// Optional try
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("The result was \(result)")
} else {
    print("Fail")
}

try! checkPassword("password123")
print("OK!")

// Failable initializers

struct Person {
    var id: String
    
    init?(id: String){
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// Type casting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let animals: [Animal] = [Fish(), Dog(), Fish(), Dog(), Fish(), Fish()]

for pet in animals {
    if let dog = pet as? Dog {
        /// as? return nil if the typecast failed
        dog.makeNoise()
    }
}
