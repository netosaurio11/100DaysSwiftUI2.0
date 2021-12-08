//
//  FriendDBO+CoreDataProperties.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 07/12/21.
//
//

import Foundation
import CoreData


extension FriendDBO {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendDBO> {
    return NSFetchRequest<FriendDBO>(entityName: "FriendDBO")
  }
  
  @NSManaged public var id: String?
  @NSManaged public var name: String?

  public var wrappedName: String {
    return name ?? "Unknown name"
  }
}

extension FriendDBO : Identifiable {
  
}
