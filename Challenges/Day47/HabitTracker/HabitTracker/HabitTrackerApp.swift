//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 28/07/21.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    var body: some Scene {
        WindowGroup {
          let localDataSource: ActivityLocalDataSource = ActivityLocalDataSource()
          let repository: ActivityRepository = ActivityRepository(localDataSource: localDataSource)
          let setActivity: SetActivityUseCase = SetActivityUseCase(repository: repository)
          let getActivity: GetActivityUseCase = GetActivityUseCase(repository: repository)

          ActivitiesView(viewModel: ActivityViewModel(getActivitiesUseCase: getActivity, setActivitiesUseCase: setActivity))
        }
    }
}
