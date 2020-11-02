import UIKit

class Album {
    var name: String

    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

// Example of polymorphism
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

/// That's polymorphism in action: an object can work as its class and its parent classes, all at the same time.
for album in allAlbums {
    print(album.getPerformance())
}

// MARK: Converting types with typecasting
for album in allAlbums {
    print(album.getPerformance())

    if let studioAlbum = album as? StudioAlbum { /// optional downcasting
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

/// Force DownCating
let forceAlbums: [Album] = [taylorSwift, fearless]
for album in forceAlbums {
    let studioAlbum = album as! StudioAlbum
    print(studioAlbum.studio)
}

// Another way to force and optional downcasting

for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.location)
}

for album in forceAlbums as! [StudioAlbum]{
    print(album.studio)
}

// MARK: Converting common types with initializers
let number: Int = 5
let text: String = String(number)

print(text)
