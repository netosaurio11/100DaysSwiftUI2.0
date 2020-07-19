import UIKit
// Five important differences between strucs and classes

// 1. Classes never come with a memberwise initializer
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let puppy: Dog = Dog(name: "Dora", breed: "Snauzer")

// 2. Class inheritance or subclassing

class Snauzer: Dog {
    init(name: String) {
        super.init(name: name, breed: "Snauzer")
    }
}

let dora: Snauzer = Snauzer(name: "Dora")

// Overridding methods
class Cat {
    func makeNoise() {
        print("miaw!")
    }
}

class Bengal: Cat {
    override func makeNoise() {
        print("mauw!")
    }
}

let puppyCat: Bengal = Bengal()
puppyCat.makeNoise()

// 3. Copying objects.
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name) /// output: Justin Bieber


struct Athlete {
    var name: String = "Usain Bolt"
}

var athlete = Athlete()
print(athlete.name)

var athleteCopy = athlete
athleteCopy.name = "Simone Biles"
print(athlete.name) /// output: Usain Bolt
print(athleteCopy.name) /// output: Simone Biles

// 4. Classes can have deinitializers
class Person {
    var name: String = "John Cena"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// 5. The final difference between classes and structs is the way they deal with constants.

class SuperHero {
    var name = "Falcon"
}

let superHero = SuperHero()
superHero.name = "Captain America"
print(superHero.name)
