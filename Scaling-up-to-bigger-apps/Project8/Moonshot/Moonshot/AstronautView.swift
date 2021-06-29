//
//  AstronautView.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 21/06/21.
//

import SwiftUI

struct AstronautView: View {
  let astronaut: Astronaut
  let missions: [Mission]

  init(astronaut: Astronaut) {
    self.astronaut = astronaut

    let missions: [Mission] = Bundle.main.decode("missions.json")
    var matches = [Mission]()
    for mission in missions where mission.crew.contains(where: { $0.name == astronaut.id }) {
      matches.append(mission)
    }

    self.missions = matches
  }

    var body: some View {
      GeometryReader { geometry in
        ScrollView(.vertical) {
          VStack {
            Image(self.astronaut.id)
              .resizable()
              .scaledToFit()
              .frame(width: geometry.size.width)

            Text(self.astronaut.description)
              .padding()
              .layoutPriority(1)

            if missions.count > 0 {
              HStack {
                Text("Missions:")
                  .font(.title)
                  .padding(.leading)
                Spacer()
              }

              ForEach(missions) { mission in
                VStack(spacing: 10) {
                  Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)

                  Text(mission.displayName)
                    .padding(.top)
                    .font(.headline)
                }
              }
            }

          }
        }
      }
      .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
  static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

  static var previews: some View {
    AstronautView(astronaut: astronauts[0])
  }
}
