//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 03/08/21.
//

import SwiftUI

struct AddActivity: View {
  @ObservedObject var activities: Activities
  @Environment(\.presentationMode) var presentationMode

  @State private var title: String = ""
  @State private var description: String = ""
  @State private var completed: Int = 0
  @State private var showingAlert = false

  var body: some View {
    NavigationView {
      Form {
        TextField("Activity title", text: $title)
        TextField("Activity description", text: $description)
        Stepper(value: $completed, in: 0...50, step: 1) {
          Text("\(completed) times")
        }
      }
      .navigationTitle("Add new activity")
      .navigationBarItems(trailing: saveButton)
      .alert(isPresented: $showingAlert) { () -> Alert in
        Alert(title: Text("Error"), message: Text("Enter text"), dismissButton: .default(Text("Ok")))
      }
    }
  }

  private var saveButton: some View {
    Button(action: {
      if !title.isEmpty && !description.isEmpty {
        let newActivity: Activity = Activity(title: title, description: description, completed: completed)
        activities.items.append(newActivity)
        self.presentationMode.wrappedValue.dismiss()
      } else {
        showingAlert.toggle()
      }
    }) {
      Text("Save")
    }
  }
}

struct AddActivity_Previews: PreviewProvider {
  static var previews: some View {
    AddActivity(activities: Activities())
  }
}
