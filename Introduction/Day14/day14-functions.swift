import UIKit


// Functons
func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}

favoriteAlbum(name: "1984")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)
printAlbumRelease(name: "Red", year: 2012)

/// External and internal parameter names
func countLettersInString(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString("Hello")

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

countLetters(in: "Bye")

/// Return values
func albumIsTaylor(name: String) -> Bool {
    let taylorAlbums: [String] = ["Taylor Swift", "Fearless", "Speak Now", "Red", "1989"]
    return taylorAlbums.contains(name)
}
albumIsTaylor(name: "Fearless")
albumIsTaylor(name: "1994")
