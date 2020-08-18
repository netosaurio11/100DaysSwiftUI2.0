import UIKit

// MARK: Protocols

protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("MY ID IS \(thing.id)")
}

// MARK: Protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// MARK: Extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number: Int = 7
number.squared() /// output: 49

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
number.isEven /// output: false

// MARK: Protocol Extensions
let pythons: [String] = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles: Set<String> = Set(["John", "Paul", "George", "Ringo"])
// Both conform to a protocol called Collection

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

// MARK: Protocol-Oriented Programming (POP)
protocol Verifiable {
    var id: String { get set }
    func identify()
}

extension Verifiable {
    func identify() {
        print("MY ID IS: \(id).")
    }
}

struct SecurityEmployee: Verifiable {
    var id: String
}

let menInBlack: SecurityEmployee = SecurityEmployee(id: "1122")
menInBlack.identify()
