//
//  Activities.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 28/07/21.
//

import UIKit

class Activities: ObservableObject {
  @Published var items: [Activity] = [] {
    didSet {
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(items) {
        UserDefaults.activities.setValue(encoded, forKey: "user_activities")
      }
    }
  }

  init() {
    if let items = UserDefaults.activities.data(forKey: "user_activities") {
      let decoder = JSONDecoder()
      if let decoded = try? decoder.decode([Activity].self, from: items) {
        self.items = decoded.isEmpty ? makeDefaultItems() : decoded
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
