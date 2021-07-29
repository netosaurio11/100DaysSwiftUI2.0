//
//  ActivitiesView.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 28/07/21.
//

import SwiftUI

struct ActivitiesView: View {
  @ObservedObject var activities = Activities()

  var body: some View {
    NavigationView {
      List {
        ForEach(activities.items, id: \.id) { activity in
          Text(activity.title)
        }
        .onDelete { self.delete(at: $0)}
        .onMove { self.move(from: $0, to: $1)}
      }
      .navigationBarTitle("Habit Tracker", displayMode: .large)
      .navigationBarItems(leading: addButton)
      .toolbar { EditButton() }
    }
  }

  private var addButton: some View {
    Button(action: {
      let activity = Activity(title: "Default", description: "Default")
      self.activities.items.append(activity)
    }) {
      Image(systemName: "plus")
    }
  }

  private func delete(at offsets: IndexSet) {
    activities.items.remove(atOffsets: offsets)
  }

  private func move(from source: IndexSet, to destination: Int) {
    activities.items.move(fromOffsets: source, toOffset: destination)
  }

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ActivitiesView()
  }
}
