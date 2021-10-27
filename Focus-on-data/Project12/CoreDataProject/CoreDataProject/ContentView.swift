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
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
