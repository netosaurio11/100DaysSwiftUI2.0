//
//  FriendDBO+CoreDataProperties.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 09/12/21.
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
    @NSManaged public var users: NSSet?

  public var wrappedName: String {
    return name ?? "Unknown Friend"
  }

  public var usersArray: [UserDBO] {
    let set = users as? Set<UserDBO> ?? []

    return set.sorted { $0.wrappedName < $1.wrappedName }
  }

}

// MARK: Generated accessors for users
extension FriendDBO {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: UserDBO)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: UserDBO)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension FriendDBO : Identifiable {

}
