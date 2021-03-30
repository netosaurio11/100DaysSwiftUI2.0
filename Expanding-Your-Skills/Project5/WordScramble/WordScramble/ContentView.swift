//
//  ContentView.swift
//  WordScramble
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 29/03/21.
//

import SwiftUI

struct ContentView: View {
  let people = ["Finn", "Leia", "Luke", "Rey"]

  var body: some View {
      List(people, id: \.self) {
          Text($0)
      }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
