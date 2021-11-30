//
//  User.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 15/11/21.
//

import Foundation

struct Person: Codable {
  let id: String
  let isActive: Bool
  let name: String
  let age: Int
  let company: String
  let email: String
  let address: String
  let about: String
  let registered: String
  let tags: [String]
  let friends: [Friend]
}

extension Person {
  init() {
    self.id = ""
    self.isActive = false
    self.name = ""
    self.age = 0
    self.company = ""
    self.email = ""
    self.address = ""
    self.about = ""
    self.registered = ""
    self.tags = []
    self.friends = []
  }
}

class User: ObservableObject{
  @Published var id: String
  @Published var isActive: Bool
  @Published var name: String
  @Published var age: Int
  @Published var company: String
  @Published var email: String
  @Published var address: String
  @Published var about: String
  @Published var registered: String
  @Published var tags: [String]
  @Published var friends: [Friend]

  init(from user: Person) {
    self.id = user.id
    self.isActive = user.isActive
    self.name = user.name
    self.age = user.age
    self.company = user.company
    self.email = user.email
    self.address = user.address
    self.about = user.about
    self.registered = user.registered
    self.tags = user.tags
    self.friends = user.friends
  }
}
