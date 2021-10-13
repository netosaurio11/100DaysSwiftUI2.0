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
  @State private var lastNameFilter = "A"

  var body: some View {
    VStack {
      FilteredListView(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
        Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
      }

      Button("Add Examples") {
        let taylor = Singer(context: self.moc)
        taylor.firstName = "Taylor"
        taylor.lastName = "Swift"

        let ed = Singer(context: self.moc)
        ed.firstName = "Ed"
        ed.lastName = "Sheeran"

        let adele = Singer(context: self.moc)
        adele.firstName = "Adele"
        adele.lastName = "Adkins"

        try? self.moc.save()
      }

      Button("Show A") {
        self.lastNameFilter = "A"
      }

      Button("Show S") {
        self.lastNameFilter = "S"
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
