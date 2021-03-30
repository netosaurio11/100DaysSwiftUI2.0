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
    let input = """
                a
                b
                c
                """
    let letters = input.components(separatedBy: "\n")
    let letter = letters.randomElement()
    let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
