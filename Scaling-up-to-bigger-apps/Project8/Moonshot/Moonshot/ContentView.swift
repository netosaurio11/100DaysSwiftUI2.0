//
//  ContentView.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 15/06/21.
//

import SwiftUI

struct ContentView: View {

  let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")

  var body: some View {
    NavigationView {
      List(missions) { mission in
        NavigationLink(destination: Text("Detail view")) {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)

          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)
            Text(mission.formattedLaunchDate)
          }
        }
      }
      .navigationBarTitle("Moonshot")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
