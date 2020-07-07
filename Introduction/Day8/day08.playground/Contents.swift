import UIKit

// Creating your own structs
struct Sport {
    var name: String
}

var tennis: Sport = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"

// Computed properties
struct Album {
    var name: String
    var isGoodAlbum: Bool
    
    var albumStatus: String {
        if isGoodAlbum {
            return "\(name) is a good album."
        } else {
            return "\(name) is not a good album."
        }
    }
}

let damn: Album = Album(name: "DAMN", isGoodAlbum: true)
let yeezus: Album = Album(name: "Yeezus", isGoodAlbum: false)
print(damn.albumStatus)
print(yeezus.albumStatus)

// Property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
    
}

var progress: Progress = Progress(task: "Loading data", amount: 0)
progress.amount = 10
progress.amount = 40
progress.amount = 100

// Methods
struct City {
    var population: Int
    
    func collectTaxes () -> Int {
        return population * 1000
    }
}

let gotham: City = City(population: 9_000_000)
gotham.collectTaxes()

// Mutating methods
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person: Person = Person(name: "John")
person.makeAnonymous()

// Properties and methods of strings
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// Properties and methods of arrays

var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
