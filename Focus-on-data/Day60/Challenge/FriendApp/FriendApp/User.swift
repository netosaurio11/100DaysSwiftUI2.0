//
//  User.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 15/11/21.
//

import Foundation

struct User: Codable {
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

extension User {
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
