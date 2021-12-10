//
//  UserDBO+CoreDataProperties.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 09/12/21.
//
//

import Foundation
import CoreData


extension UserDBO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDBO> {
        return NSFetchRequest<UserDBO>(entityName: "UserDBO")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var friends: NSSet?

  public var wrappedName: String {
    return name ?? "Unknown User"
  }

  public var wrappedAge: Int {
    return Int(age)
  }

  public var wrappedCompany: String {
    return company ?? "Unknown company"
  }

  public var wrappedEmail: String {
    return email ?? "Unknown email"
  }

  public var wrappedAddress: String {
    return address ?? "Unknown address"
  }

  public var wrappedAbout: String {
    return about ?? "Nothing"
  }

  public var wrappedRegistered: String {
    return registered ?? "NA"
  }

  public var friendsArray: [FriendDBO] {
    let set = friends as? Set<FriendDBO> ?? []

    return set.sorted { $0.wrappedName < $1.wrappedName }
  }

}

// MARK: Generated accessors for friends
extension UserDBO {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: FriendDBO)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: FriendDBO)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension UserDBO : Identifiable {

}
