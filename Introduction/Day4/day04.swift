import UIKit

// For loops
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}

// While loops
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

// Repeat loops
number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

// Exiting loops
/// You can exit a loop at any time using the break keyword
var countdown = 10

while countdown >= 0 {
    print(countdown)
    
    if countdown == 4 {
        print("Let's go now!")
        break
    }
    
    countdown -= 1
}

// Exiting multiple loops

outer: for i in 1...5 {
    for j in 1...5 {
        let product = i * j
        print("i * j is equal to \(product)")
        if product == 20 {
            print("Bye!")
            break outer
        }
    }
}

// Skipping items
/// you should use 'continue' keyword
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}
