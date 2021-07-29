//
//  Activity.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 28/07/21.
//

import Foundation

struct Activity: Identifiable, Codable {
  let id = UUID()
  let title: String
  let description: String
  var completed: Int = 0
}

extension UserDefaults {
  class var activities: UserDefaults {
    return UserDefaults(suiteName: "user_activities") ?? UserDefaults.standard
  }
}
