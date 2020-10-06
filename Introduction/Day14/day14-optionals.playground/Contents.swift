import UIKit

// Optionals
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status: String?
status = getHaterStatus(weather: "rainy")

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

// Optional unwrapping
if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}

// Force unwrapping optionals
func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return nil
}

var year = yearAlbumReleased(name: "Red")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")
}


// Optional chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}
let album = albumReleased(year: 2006)
print("The album is \(album)")

let album2 = albumReleased(year: 2006)?.uppercased()
print("The album is \(album2)")

// The nil coalescing operator
let album3 = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album3)")
