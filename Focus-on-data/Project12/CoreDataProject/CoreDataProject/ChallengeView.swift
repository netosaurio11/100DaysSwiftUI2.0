//
//  ChallengeView.swift
//  CoreDataProject
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 26/10/21.
//

import SwiftUI

enum SortedDescription: String, CaseIterable {
  case firstNameAscending
  case firstNameDescending
  case lastNameAscending
  case lastNameDescending

  var text: String {
    switch self {
    case .firstNameAscending:
      return "Firstname ascending"
    case .firstNameDescending:
      return "Firstname descending"
    case .lastNameAscending:
      return "Lastname ascending"
    case .lastNameDescending:
      return "Lastname descending"
    }
  }

  var descriptor: [NSSortDescriptor] {
    switch self {
    case .firstNameAscending:
      return [NSSortDescriptor(key: "firstName", ascending: true)]
    case .firstNameDescending:
      return [NSSortDescriptor(key: "firstName", ascending: false)]
    case .lastNameAscending:
      return [NSSortDescriptor(key: "lastName", ascending: true)]
    case .lastNameDescending:
      return [NSSortDescriptor(key: "lastName", ascending: false)]
    }
  }
}

struct ChallengeView: View {
  @Environment(\.managedObjectContext) var moc
  @State private var sortedDescription: SortedDescription = .firstNameAscending
  @State private var lastNameFilter = "A"


  var body: some View {
    VStack {
      Section(header: Text("Filtered list")) {
        FilteredListView(filterKey: "firstName", filterValue: lastNameFilter, descriptors: sortedDescription.descriptor) { (singer: Singer) in
          Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
      }

      Section(header: Text("Filter configuration")) {
        Form {
          Picker("Sort description", selection: $sortedDescription) {
            ForEach(SortedDescription.allCases, id: \.self) { descriptor in
              Text(descriptor.text)
            }
          }
        }

        Button("Add Examples") {
          let kendrick = Singer(context: self.moc)
          kendrick.firstName = "Kendrick"
          kendrick.lastName = "Lamar"

          let ana = Singer(context: self.moc)
          ana.firstName = "Ana"
          ana.lastName = "Gabriel"

          let jhay = Singer(context: self.moc)
          jhay.firstName = "Jhay"
          jhay.lastName = "Cortez"

          let taylor = Singer(context: self.moc)
          taylor.firstName = "Taylor"
          taylor.lastName = "Swift"

          let ed = Singer(context: self.moc)
          ed.firstName = "Ed"
          ed.lastName = "Sheeran"

          let adele = Singer(context: self.moc)
          adele.firstName = "Adele"
          adele.lastName = "Adkins"

          try? self.moc.save()
        }
      }
    }
  }
}

struct ChallengeView_Previews: PreviewProvider {
  static var previews: some View {
    ChallengeView()
  }
}
