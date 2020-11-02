import UIKit

// MARK: Properties observers
struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    
    func updateUI(msg: String) {
        print(msg)
    }
}

var taylor: Person = Person(clothes: "T-shirt")
taylor.clothes = "Top"

// MARK: Computed properties
struct Human {
    var age: Int
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
}

var fan: Human = Human(age: 24)
print(fan.ageInDogYears)

// MARK: Static properties
struct TaylorFan {
    static var favoriteSong: String = "Look What you Made me Do"
    
    var name: String
    var age: Int
}

let taylorFan: TaylorFan = TaylorFan(name: "Angel", age: 24)
print(TaylorFan.favoriteSong)
