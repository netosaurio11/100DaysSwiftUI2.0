//
//  ContentView.swift
//  Bookworm
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 09/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var moc

  @FetchRequest(entity: Student.entity(), sortDescriptors: [])
  private var students: FetchedResults<Student>

  var body: some View {
    VStack {
      List {
        ForEach(students, id: \.id) { student in
          Text(student.name ?? "Unknown")
        }
      }

      Button("Add") {
        let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
        let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

        let chosenFirstName = firstNames.randomElement()!
        let chosenLastName = lastNames.randomElement()!

        let student = Student(context: self.moc)
        student.id = UUID()
        student.name = "\(chosenFirstName) \(chosenLastName)"

        try? self.moc.save()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
