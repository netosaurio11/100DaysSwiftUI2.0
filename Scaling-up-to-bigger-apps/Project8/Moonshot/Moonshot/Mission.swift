//
//  Mission.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 16/06/21.
//

import Foundation

struct Mission: Codable, Identifiable {
  struct CrewRole: Codable {
    let name: String
    let role: String
  }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
