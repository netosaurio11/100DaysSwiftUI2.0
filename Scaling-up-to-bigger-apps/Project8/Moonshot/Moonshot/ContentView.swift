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
    Text("\(astronauts.count)")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
