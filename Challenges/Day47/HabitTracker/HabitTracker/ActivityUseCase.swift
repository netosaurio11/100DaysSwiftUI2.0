//
//  ActivityUseCase.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 12/08/21.
//

import Foundation

protocol GetActivityUseCaseProtocol {
  var repository: ActivityRepositoryProtocol { get set }
  func execute() -> [ActivityDomain.Activity]
}

protocol SetActivityUseCaseProtocol {
  var repository: ActivityRepositoryProtocol { get set }
  func execute(_ activities: [ActivityDomain.Activity])
}

struct GetActivityUseCase: GetActivityUseCaseProtocol{
  var repository: ActivityRepositoryProtocol

  func execute() -> [ActivityDomain.Activity] {
    repository.getActivities().map { ActivityDomain.Activity(from: $0) }
  }
}

struct SetActivityUseCase: SetActivityUseCaseProtocol {
  var repository: ActivityRepositoryProtocol

  func execute(_ activities: [ActivityDomain.Activity]) {
    repository.setActivities(activities.map { Activity(from: $0) } )
  }
}
