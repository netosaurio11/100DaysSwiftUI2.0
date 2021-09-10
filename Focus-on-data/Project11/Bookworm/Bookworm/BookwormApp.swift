//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 09/09/21.
//

import SwiftUI

@main
struct BookwormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
