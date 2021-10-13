//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 07/10/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) var moc

  // MARK: Example of predicates
  /// "universe == %@", "Star Wars"
  /// "name < %@", "F"
  /// "universe IN %@", ["Aliens", "Firefly", "Star Trek"]
  /// "name BEGINSWITH %@", "E"
  /// "name BEGINSWITH[c] %@", "e" -> ignoring case-sensitive
  /// "NOT name BEGINSWITH[c] %@", "e"

  @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"))
  var ships: FetchedResults<Ship>

  var body: some View {
    VStack {
      List(ships, id:\.self) { ship in
        Text(ship.name ?? "Unknown name")
      }

      Button("Add examples") {
        let ship1 = Ship(context: self.moc)
        ship1.name = "Enterprise"
        ship1.universe = "Star Trek"

        let ship2 = Ship(context: self.moc)
        ship2.name = "Defiant"
        ship2.universe = "Star Trek"

        let ship3 = Ship(context: self.moc)
        ship3.name = "Millennium Falcon"
        ship3.universe = "Star Wars"

        let ship4 = Ship(context: self.moc)
        ship4.name = "Executor"
        ship4.universe = "Star Wars"

        try? self.moc.save()
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
