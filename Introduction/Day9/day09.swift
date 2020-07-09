import UIKit

// Initializers
struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user: User = User()
user.username = "netosaurio11"

// Referring to the current instance
struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct PersonLazy {
    var name: String
    var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = PersonLazy(name: "Ed")

/// Lazy properties are created only when you access to them
/// To see "Creating family tree you have to access like this:"
ed.familyTree

// Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

var eddy: Student = Student(name: "Eddy")
var taylor: Student = Student(name: "Taylor")

print(Student.classSize)

// Access Control
struct Customer {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

var customer: Customer = Customer(id: "3312")
/// print(customer.id)this won't work
customer.identify()
