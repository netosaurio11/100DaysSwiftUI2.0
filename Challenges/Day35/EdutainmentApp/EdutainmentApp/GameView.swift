//
//  GameView.swift
//  EdutainmentApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 10/05/21.
//

import SwiftUI

struct GameView: View {
  @Environment(\.presentationMode) var presentationMode

  @State private var currentQuestion: Int = 0
  @State private var finished: Bool = false
  @State private var scoreAmount: Int = 0

  private var gameConfiguration: GameGenerator?
  private let questions: [Question]

  init(_ mode: GameMode, _ questions: NumberOfQuestion, _ table: Int) {
    gameConfiguration = GameGenerator(gameMode: mode, selectedQuestions: questions, targetTable: table)
    self.questions = gameConfiguration?.getQuestions() ?? []
  }

  var body: some View {

    VStack(spacing: 20) {

      if finished {
        // Game Over
        Text("Great work!")
          .font(.largeTitle)
          .transition(.asymmetric(insertion: .scale, removal: .opacity))

        Button("Return") {
          presentationMode.wrappedValue.dismiss()
        }
        .frame(width: 100, height: 50)
        .foregroundColor(.white)
        .background(Color.green)
        .cornerRadius(6)
        .transition(.asymmetric(insertion: .scale, removal: .opacity))

      } else {
        Text(questions[currentQuestion].questionDescription)

        // Buttons
        ForEach(getOptions(with: questions[currentQuestion].answer), id: \.self) { option in
          OptionButton(number: option, isCorrect: option == questions[currentQuestion].answer) {
            self.numberTapped(with: $0)
          }
        }
        Text("Score: \(scoreAmount)")
      }
    }
  }

  private func getOptions(with answer: Int) -> [Int] {
    return [Int.random(in: 1...100), Int.random(in: answer/3...100), answer].shuffled()
  }

  private func askNextQuestion() {
    guard currentQuestion < questions.count - 1 else {
      finished = true
      return
    }
    currentQuestion += 1
  }

  private func numberTapped(with value: Int) {
    if value == questions[currentQuestion].answer {
      scoreAmount += 1
    }
    askNextQuestion()
  }
}

struct GameView_Previews: PreviewProvider {
  static var previews: some View {
    GameView(.simple, .five, 2)
  }
}
