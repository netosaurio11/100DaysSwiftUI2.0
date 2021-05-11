//
//  ContentView.swift
//  EdutainmentApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 03/05/21.
//

import SwiftUI

struct ContentView: View {

  @State private var targetTable: Int = 2
  @State private var selectedQuestions: NumberOfQuestion = .five
  @State private var startingGame: Bool = false
  @State private var gameMode: GameMode = .simple

  private var numberOfQuestions: [NumberOfQuestion] = [.five, .ten, .twenty, .all]
  private var gameModes: [GameMode] = [.simple, .multiple]

  private var tablesToPractice: String {
    return gameMode.titleLabel + "\(targetTable)"
  }

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Game configuration")) {
          Picker("Mode", selection: $gameMode) {
            ForEach(gameModes, id: \.self) { mode in
              Text(mode.description)
            }
          }
          Stepper(value: $targetTable, in: 2 ... 12, step: 1) {
            Text(tablesToPractice)
          }
          Picker("How many questions?", selection: $selectedQuestions) {
            ForEach(numberOfQuestions, id: \.self) { question in
              Text(question.description)
            }
          }
        }

        Button("Start Game") {
          startingGame.toggle()
        }
        .sheet(isPresented: $startingGame) {
          GameView(gameMode, selectedQuestions, targetTable)
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
