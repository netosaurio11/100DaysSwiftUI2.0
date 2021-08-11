//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 09/08/21.
//

import SwiftUI

struct ActivityDetailView: View {
  @Binding var activity: Activity

  var body: some View {
    Form {
      Section(header: Text(activity.description)) {
        Stepper(value: $activity.completed, in: 0...50, step: 1) {
          Text("Completion count: \(activity.completed)")
        }
      }
    }
    .navigationBarTitle(Text(activity.title), displayMode: .inline)
  }
}

struct ActivityDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityDetailView(activity: .constant(Activity(title: "", description: "")))
  }
}
