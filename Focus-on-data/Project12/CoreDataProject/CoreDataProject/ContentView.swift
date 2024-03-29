//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 07/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
  // MARK: Example of predicates
  /// "universe == %@", "Star Wars"
  /// "name < %@", "F"
  /// "universe IN %@", ["Aliens", "Firefly", "Star Trek"]
  /// "name BEGINSWITH %@", "E"
  /// "name BEGINSWITH[c] %@", "e" -> ignoring case-sensitive
  /// "NOT name BEGINSWITH[c] %@", "e"
  @Environment(\.managedObjectContext) var moc

  @FetchRequest(entity: Country.entity(), sortDescriptors: [])
  var countries: FetchedResults<Country>

  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(countries, id: \.self) { country in
            Section(header: Text(country.wrappedFullName)) {
              ForEach(country.candyArray, id: \.self) { candy in
                Text(candy.wrappedName)
              }
            }
          }
          NavigationLink("Challenge", destination: ChallengeView())
        }

        Button("Add") {
            let candy1 = Candy(context: self.moc)
            candy1.name = "Mars"
            candy1.origin = Country(context: self.moc)
            candy1.origin?.shortName = "UK"
            candy1.origin?.fullName = "United Kingdom"

            let candy2 = Candy(context: self.moc)
            candy2.name = "KitKat"
            candy2.origin = Country(context: self.moc)
            candy2.origin?.shortName = "UK"
            candy2.origin?.fullName = "United Kingdom"

            let candy3 = Candy(context: self.moc)
            candy3.name = "Twix"
            candy3.origin = Country(context: self.moc)
            candy3.origin?.shortName = "UK"
            candy3.origin?.fullName = "United Kingdom"

            let candy4 = Candy(context: self.moc)
            candy4.name = "Toblerone"
            candy4.origin = Country(context: self.moc)
            candy4.origin?.shortName = "CH"
            candy4.origin?.fullName = "Switzerland"

            try? self.moc.save()
        }
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
