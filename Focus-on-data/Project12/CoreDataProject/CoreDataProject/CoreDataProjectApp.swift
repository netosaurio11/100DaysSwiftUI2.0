//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 07/10/21.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
