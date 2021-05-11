//
//  GameView.swift
//  EdutainmentApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 10/05/21.
//

import SwiftUI

struct GameView: View {
  @Environment(\.presentationMode) var presentationMode

  private var gameConfiguration: GameGenerator?
  private let questions: [Question]

  init(_ mode: GameMode, _ questions: NumberOfQuestion, _ table: Int) {
    gameConfiguration = GameGenerator(gameMode: mode, selectedQuestions: questions, targetTable: table)
    self.questions = gameConfiguration?.getQuestions() ?? []
  }

  var body: some View {

    Text(questions.first?.questionDescription ?? "")

    Button("Return") {
      presentationMode.wrappedValue.dismiss()
    }
    .foregroundColor(.white)
    .font(.title)
    .padding()
    .background(Color.blue)
  }
}

struct GameView_Previews: PreviewProvider {
  static var previews: some View {
    GameView(.simple, .five, 2)
  }
}
