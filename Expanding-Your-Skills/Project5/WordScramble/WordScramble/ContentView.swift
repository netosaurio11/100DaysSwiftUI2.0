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
    if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt"), let fileContents = try? String(contentsOf: fileURL) {
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
