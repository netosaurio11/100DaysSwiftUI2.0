//
//  ContentView.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 15/06/21.
//

import SwiftUI

struct ContentView: View {

  @State private var showingDates = true
  var buttonTitle: String {
    showingDates ? "Show crew" : "Show date"
  }

  let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")

  var body: some View {
    NavigationView {
      List(missions) { mission in
        NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)

          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)
            Text(getTextFor(mission))
              .fixedSize(horizontal: false, vertical: true)
          }
        }
      }
      .navigationBarTitle("Moonshot")
      .navigationBarItems(trailing: Button(buttonTitle) {
        self.showingDates.toggle()
      })
    }
  }

  func getTextFor(_ mission: Mission) -> String {

    if showingDates {
      return mission.formattedLaunchDate
    } else {
      return mission.crew.map { $0.name.capitalized }.joined(separator: ", ")
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
