//
//  ContentView.swift
//  EdutainmentApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 03/05/21.
//

import SwiftUI

struct ContentView: View {

  @State private var targetTable: Int = 2
  @State private var numberOfQuestionsId: Int = 0
  @State private var startingGame: Bool = false
  @State private var gameMode: Int = 0

  private var numberOfQuestions: [String] = ["5", "10", "20", "All"]
  private var gameModes: [GameMode] = [.simple, .multiple]

  private var tablesToPractice: String {
    return gameMode == 0 ? "Selected table: \(targetTable)" : "Tables up to... \(targetTable)"
  }

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Game configuration")) {
          Picker("Mode", selection: $gameMode) {
            ForEach(0 ..< gameModes.count) {
              Text(self.gameModes[$0].description)
            }
          }
          Stepper(value: $targetTable, in: 2 ... 12, step: 1) {
            Text(tablesToPractice)
          }
          Picker("How many questions?", selection: $numberOfQuestionsId) {
            ForEach(0 ..< numberOfQuestions.count) {
              Text(self.numberOfQuestions[$0])
            }
          }
        }

        Button("Start Game") {
          startingGame = true
          print("Do something")
        }
      }
      .navigationTitle("EdutApp")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
