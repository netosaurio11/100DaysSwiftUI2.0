//
//  UserDataManager.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 01/12/21.
//

import Foundation
import CoreData

class UserDataManager: ObservableObject {
  let container = NSPersistentContainer(name: "UserData")

  init() {
    container.loadPersistentStores { description, error in
      if let error = error {
        print("Core Data failed to load: \(error.localizedDescription)")
      }
    }
  }
}
