//
//  ActivityDomain.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 12/08/21.
//

import Foundation

enum ActivityDomain {
  struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var completed: Int = 0
  }
}

extension ActivityDomain.Activity {
  init(from activity: Activity) {
    self.title = activity.title
    self.description = activity.description
    self.completed = activity.completed
  }
}
