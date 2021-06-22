//
//  MissionView.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 21/06/21.
//

import SwiftUI

struct MissionView: View {
  let mission: Mission
  let astronauts: [CrewMember]

  init(mission: Mission, astronauts: [Astronaut]) {
    self.mission = mission
    var matches = [CrewMember]()

    for member in mission.crew {
      if let match = astronauts.first(where: { $0.id == member.name }) {
        matches.append(CrewMember(role: member.role, astronaut: match))
      } else {
        fatalError("Missing \(member)")
      }
    }
    self.astronauts = matches
  }

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    GeometryReader { geometry in
      ScrollView(.vertical) {
        VStack {
          Image(self.mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geometry.size.width * 0.7)
            .padding(.top)

          Text(self.mission.description)
            .padding()

          ForEach(self.astronauts, id: \.role) { crewMember in
            HStack {
              Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.orange, lineWidth: 1))

              VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                  .font(.headline)
                Text(crewMember.role)
                  .foregroundColor(crewMember.foreGroundColor)
              }
              Spacer()
            }
            .padding(.horizontal)
          }

          Spacer(minLength: 25)
        }
      }
    }
    .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

  static var previews: some View {
    MissionView(mission: missions[0], astronauts: astronauts)
  }
}
