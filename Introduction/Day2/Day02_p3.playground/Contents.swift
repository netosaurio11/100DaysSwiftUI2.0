import UIKit

// Enums
/// groups of related values

let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure /// output: failure

// Enum associated values
/// This lets you attach additional information to your enums so they can represent more nuanced data.

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let running: Activity = .running(destination: "México") /// output: running(destination: "México")
let talking = Activity.talking(topic: "Football") /// output: talking(topic: "Football")

// Enum raw values
/// Sometimes you need to be able to assign values to enums so they have meaning.

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3) /// output: earth
