import UIKit

// Using closures as parameters when they accept parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place) in
    print("I'm going to \(place) in my car")
}

// Using closures as parameters when they return value
func travelWithReturn(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description: String = action("México")
    print(description)
    print("I arrived!")
}

travelWithReturn { (place) -> String in
    return "I'm going to \(place) in my car"
}

// Shorthand oaraneters names
travelWithReturn { (place: String) -> String in
    return "I'm going to \(place) in my car."
}

travelWithReturn { place -> String in
    return "I'm going to \(place) in my car. (1)"
}

travelWithReturn { place in
    return "I'm going to \(place) in my car. (2)"
}

travelWithReturn { place in
    "I'm going to \(place) in my car. (3)"
}

travelWithReturn {
    "I'm going to \($0) in my car. (4)"
}

// Closures with multiple parameters
func travelWithMultipleParameters(action: (String, Int) -> String) {
    print("I'm getting ready to go")
    let description: String = action("México", 99)
    print(description)
    print("I arrived!")
}

travelWithMultipleParameters {
    "I'm going to \($0) at \($1) kilemeters per hour."
}

// Returning closures from functions
func travelReturnClosure() -> (String) -> Void {
    return {
        print("I'm goint to \($0)")
    }
}

let travel: (String) -> Void = travelReturnClosure()
travel("Cancún")

// Capturing values
func travelCapturingValues() -> (String) -> Void {
    var counter: Int = 1
    
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let resultCaptured: (String) -> Void = travelCapturingValues()
resultCaptured("Tokyo")
resultCaptured("Tokyo")
resultCaptured("Tokyo")
