//
//  ActivitiesView.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 28/07/21.
//

import SwiftUI

struct ActivitiesView<ViewModel: ActivityViewModelProtocol>: View {

  @ObservedObject var viewModel: ViewModel
  @State private var showingAddActivity = false

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.activities.indices, id: \.self) { index in
          NavigationLink(destination: ActivityDetailView(activity: self.$viewModel.activities[index])) {
            HStack {
              Image(systemName: "face.dashed.fill")
                .font(.largeTitle)
                .foregroundColor(.purple)
              Text(self.viewModel.activities[index].title)
            }
          }
        }
        .onDelete { self.delete(at: $0)}
        .onMove { self.move(from: $0, to: $1)}
      }
      .navigationBarTitle("Habit Tracker", displayMode: .large)
      .navigationBarItems(leading: addButton)
      .toolbar { EditButton() }
      .sheet(isPresented: $showingAddActivity) {
        AddActivityView(activities: viewModel)
      }
    }
    .onAppear {
      viewModel.getActivities()
    }
  }

  private var addButton: some View {
    Button(action: {
      showingAddActivity = true
    }) {
      Image(systemName: "plus")
    }
  }

  private func delete(at offsets: IndexSet) {
    viewModel.activities.remove(atOffsets: offsets)
  }

  private func move(from source: IndexSet, to destination: Int) {
    viewModel.activities.move(fromOffsets: source, toOffset: destination)
  }

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let localDataSource: ActivityLocalDataSource = ActivityLocalDataSource()
    let repository: ActivityRepository = ActivityRepository(localDataSource: localDataSource)
    let setActivity: SetActivityUseCase = SetActivityUseCase(repository: repository)
    let getActivity: GetActivityUseCase = GetActivityUseCase(repository: repository)

    ActivitiesView(viewModel: ActivityViewModel(getActivitiesUseCase: getActivity, setActivitiesUseCase: setActivity))
  }
}
