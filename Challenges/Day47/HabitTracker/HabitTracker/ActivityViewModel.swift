//
//  ActivityViewModel.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 28/07/21.
//

import UIKit

protocol ActivityViewModelProtocol: ObservableObject {
  var activities: [ActivityDomain.Activity] { get set }
  func getActivities()
}

class ActivityViewModel: ActivityViewModelProtocol {

  let getActivitiesUseCase: GetActivityUseCaseProtocol
  let setActivitiesUseCase: SetActivityUseCaseProtocol

  @Published var activities: [ActivityDomain.Activity] = [] {
    didSet {
      setActivitiesUseCase.execute(activities)
    }
  }

  init(getActivitiesUseCase: GetActivityUseCaseProtocol, setActivitiesUseCase: SetActivityUseCaseProtocol) {
    self.getActivitiesUseCase = getActivitiesUseCase
    self.setActivitiesUseCase = setActivitiesUseCase
  }

  func getActivities() {
    activities = getActivitiesUseCase.execute()
  }
}
