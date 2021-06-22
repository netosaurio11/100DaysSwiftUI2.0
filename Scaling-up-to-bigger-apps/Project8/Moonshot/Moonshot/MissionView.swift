//
//  MissionView.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 21/06/21.
//

import SwiftUI

struct MissionView: View {
  let mission: Mission

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

          Spacer(minLength: 25)
        }
      }
    }
    .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")

  static var previews: some View {
    MissionView(mission: missions[0])
  }
}
