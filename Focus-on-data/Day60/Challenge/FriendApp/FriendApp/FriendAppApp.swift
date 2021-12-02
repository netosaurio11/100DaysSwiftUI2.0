//
//  FriendAppApp.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 15/11/21.
//

import SwiftUI

@main
struct FriendAppApp: App {
  @StateObject private var dataManager = UserDataManager()

  var body: some Scene {
    WindowGroup {
      UsersListView()
        .environment(\.managedObjectContext, dataManager.container.viewContext)
    }
  }
}
