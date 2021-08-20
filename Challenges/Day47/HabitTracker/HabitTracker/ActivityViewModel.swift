//
//  ActivityViewModel.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 28/07/21.
//

import UIKit
import Combine

protocol ActivityViewModelProtocol: ObservableObject {
  var activities: [ActivityDomain.Activity] { get set }
  func getActivities()
}

class ActivityViewModel: ActivityViewModelProtocol {

  let getActivitiesUseCase: GetActivityUseCaseProtocol
  let setActivitiesUseCase: SetActivityUseCaseProtocol
  var cancellables = Set<AnyCancellable>()

  @Published var activities: [ActivityDomain.Activity] = [] {
    didSet {
      setActivitiesUseCase.execute(activities)
    }
  }
  @Published var error: Error?

  init(getActivitiesUseCase: GetActivityUseCaseProtocol, setActivitiesUseCase: SetActivityUseCaseProtocol) {
    self.getActivitiesUseCase = getActivitiesUseCase
    self.setActivitiesUseCase = setActivitiesUseCase
  }

  func getActivities() {
    getActivitiesUseCase.execute()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { subscriptionCompleted in

        switch subscriptionCompleted {
        case .finished:
          break
        case .failure(let error):
          self.error = error
        }
      }, receiveValue: { (activities) in
        self.activities = activities
      }).store(in: &cancellables)
  }
}
