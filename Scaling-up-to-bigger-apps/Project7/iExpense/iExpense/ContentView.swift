//
//  ContentView.swift
//  iExpense
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 31/05/21.
//

import SwiftUI

struct ContentView: View {
  @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

  var body: some View {
    Button("Tap count: \(tapCount)") {
      self.tapCount += 1
      UserDefaults.standard.set(self.tapCount, forKey: "Tap")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
