//
//  ActivityDataSource.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 12/08/21.
//

import Foundation
import Combine

// AcitivityRemoteDataSource should be here

enum ActivityError: LocalizedError {
  case resourceNotFoud
}

protocol ActivityLocalDataSourceProtocol {
  func getLocalActivities() -> AnyPublisher<[Activity], Error>
  func setLocalActivities(_ activities: [Activity])
}

class ActivityLocalDataSource: ActivityLocalDataSourceProtocol {
  func getLocalActivities() -> AnyPublisher<[Activity], Error> {
    Future<[Activity], Error> { promise in
      let items = UserDefaults.activities.data(forKey: "user_activities") ?? Data()
      let decoder = JSONDecoder()

      if let decoded = try? decoder.decode([Activity].self, from: items) {
        promise(.success(decoded))
      } else {
        promise(.failure(ActivityError.resourceNotFoud))
      }
    }.eraseToAnyPublisher()
  }

  func setLocalActivities(_ activities: [Activity]) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(activities) {
      UserDefaults.activities.setValue(encoded, forKey: "user_activities")
    }
  }
}
