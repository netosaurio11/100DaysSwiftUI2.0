//
//  ActivityViewModel.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 28/07/21.
//

import UIKit

class ActivityViewModel: ObservableObject {
  @Published var activities: [Activity] = [] {
    didSet {
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(activities) {
        UserDefaults.activities.setValue(encoded, forKey: "user_activities")
      }
    }
  }

  func getActivities() {
    if let items = UserDefaults.activities.data(forKey: "user_activities") {
      let decoder = JSONDecoder()
      if let decoded = try? decoder.decode([Activity].self, from: items) {
        self.activities = decoded.isEmpty ? makeDefaultItems() : decoded
        return
      }
    }
  }

  func makeDefaultItems() -> [Activity] {
     return [
      Activity(title: "Soccer", description: "Every saturday night"),
      Activity(title: "Reading", description: "Every saturday night"),
      Activity(title: "Golf", description: "Every saturday night")
    ]
  }
}
