//
//  ActivityRepository.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 12/08/21.
//

import Foundation

protocol ActivityRepositoryProtocol {
  func getActivities() -> [Activity]
  func setActivities(_ activities: [Activity])
}

class ActivityRepository: ActivityRepositoryProtocol {
  var localDataSource: ActivityLocalDataSourceProtocol
  // remote data source should be here

  init(localDataSource: ActivityLocalDataSourceProtocol) {
    self.localDataSource = localDataSource
  }

  func getActivities() -> [Activity] {
    localDataSource.getLocalActivities()
  }

  func setActivities(_ activities: [Activity]) {
    localDataSource.setLocalActivities(activities)
  }
}
