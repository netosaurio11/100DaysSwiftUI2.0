//
//  ActivityDataSource.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 12/08/21.
//

import Foundation

// AcitivityRemoteDataSource should be here

protocol ActivityLocalDataSourceProtocol {
  func getLocalActivities() -> [Activity]
  func setLocalActivities(_ activities: [Activity])
}

class ActivityLocalDataSource: ActivityLocalDataSourceProtocol {
  func getLocalActivities() -> [Activity] {
    let items = UserDefaults.activities.data(forKey: "user_activities") ?? Data()
    let decoder = JSONDecoder()

    guard let decoded = try? decoder.decode([Activity].self, from: items) else { return [] }
    return decoded
  }

  func setLocalActivities(_ activities: [Activity]) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(activities) {
      UserDefaults.activities.setValue(encoded, forKey: "user_activities")
    }
  }
}
