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

  var filterKey: String {
    switch self {
    case .firstNameAscending, .firstNameDescending:
      return "firstName"
    case .lastNameAscending, .lastNameDescending:
      return "lastName"
    }
  }

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

enum PredicateDescription: String, CaseIterable {
  case equalsTo
  case smallerThan
  case greaterThan
  case smallerOrEqualThan
  case greaterOrEqualThan
  case beginsWith
  case beginsWithCaseSensitive

  var description: String {
    switch self {
    case.equalsTo:
      return "=="
    case .smallerThan:
      return "<"
    case .greaterThan:
      return ">"
    case .smallerOrEqualThan:
      return "<="
    case .greaterOrEqualThan:
      return ">="
    case .beginsWith:
      return "BEGINSWITH"
    case .beginsWithCaseSensitive:
      return "BEGINSWITH[c]"
    }
  }
}

struct ChallengeView: View {
  @Environment(\.managedObjectContext) var moc
  @State private var sortedDescription: SortedDescription = .firstNameAscending
  @State private var predicate: PredicateDescription = .equalsTo
  @State private var letterFilter = "A"

  let lettersFilter: [String] = ["A", "J", "K", "O", "T", "L", "G", "C", "S"]


  var body: some View {
    Group {
      Form {
        Section(header: Text("Filter configuration")) {
          // 1. Make it accept an array of NSSortDescriptor objects to get used in its fetch request.
          Picker("Sort description", selection: $sortedDescription) {
            ForEach(SortedDescription.allCases, id: \.self) { descriptor in
              Text(descriptor.text)
            }
          }

          Picker("Letter filter", selection: $letterFilter) {
            ForEach(lettersFilter, id: \.self) { letter in
              Text(letter)
            }
          }

          // 2. & 3. Modify the predicate string parameter to be an enum such as .beginsWith
          Picker("Predicate", selection: $predicate) {
            ForEach(PredicateDescription.allCases, id: \.self) { predicate in
              Text(predicate.description)
            }
          }
        }
      }

      Text("Filtered list")
        .font(.headline)
      FilteredListView(filterKey: sortedDescription.filterKey, filterValue: letterFilter, predicate: predicate.description, descriptors: sortedDescription.descriptor) { (singer: Singer) in
        Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
      }
      Spacer()
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

      .navigationBarTitle("Challenge View", displayMode: .large)
    }
  }
}

struct ChallengeView_Previews: PreviewProvider {
  static var previews: some View {
    ChallengeView()
  }
}
