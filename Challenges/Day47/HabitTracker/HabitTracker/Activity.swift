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

extension Activity{
  init(from activity: ActivityDomain.Activity) {
    self.title = activity.title
    self.description = activity.description
    self.completed = activity.completed
  }
}

extension UserDefaults {
  class var activities: UserDefaults {
    return UserDefaults(suiteName: "user_activities") ?? UserDefaults.standard
  }
}
