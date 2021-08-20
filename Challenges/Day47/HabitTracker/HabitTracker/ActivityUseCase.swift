//
//  ActivityUseCase.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 12/08/21.
//

import Foundation
import Combine

protocol GetActivityUseCaseProtocol {
  var repository: ActivityRepositoryProtocol { get set }
  func execute() -> AnyPublisher<[ActivityDomain.Activity], Error>
}

protocol SetActivityUseCaseProtocol {
  var repository: ActivityRepositoryProtocol { get set }
  func execute(_ activities: [ActivityDomain.Activity])
}

struct GetActivityUseCase: GetActivityUseCaseProtocol{
  var repository: ActivityRepositoryProtocol

  func execute() -> AnyPublisher<[ActivityDomain.Activity], Error> {
    repository.getActivities()
      .tryMap { activities in
      return activities.map { ActivityDomain.Activity(from: $0) }
    }
      .eraseToAnyPublisher()
  }
}

struct SetActivityUseCase: SetActivityUseCaseProtocol {
  var repository: ActivityRepositoryProtocol

  func execute(_ activities: [ActivityDomain.Activity]) {
    repository.setActivities(activities.map { Activity(from: $0) } )
  }
}
