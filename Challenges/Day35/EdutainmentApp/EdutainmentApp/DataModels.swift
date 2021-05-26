//
//  DataModels.swift
//  EdutainmentApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 03/05/21.
//

import Foundation
import SwiftUI

struct Question {
  var firstNumber: Int
  var secondNumber: Int
  var answer: Int { firstNumber * secondNumber }

  var questionDescription: String { "\(firstNumber) * \(secondNumber) = ¿?" }
}

enum GameMode: Equatable {
  case simple
  case multiple

  var description: String {
    switch self {
    case .simple:
      return "Simple"
    case .multiple:
      return "Multiple"
    }
  }

  var titleLabel: String {
    switch self {
    case .simple:
      return "Selected table: "
    case .multiple:
      return "Tables up to..."
    }
  }
}

enum NumberOfQuestion {
  case five
  case ten
  case twenty
  case all

  var description: String {
    switch self {
    case .five:
      return "5"
    case .ten:
      return "10"
    case .twenty:
      return "20"
    case .all:
      return "All"
    }
  }
}

struct GameGenerator {
  var gameMode: GameMode
  var selectedQuestions: NumberOfQuestion
  var targetTable: Int

  func getQuestions() -> [Question] {
    var questions: [Question] = []

    if gameMode == .simple {
      for i in 1...10 {
        questions.append(Question(firstNumber: targetTable, secondNumber: i))
      }
    } else {
      for i in 1...targetTable {
        for j in 1...10 {
          questions.append(Question(firstNumber: i, secondNumber: j))
        }
      }
    }

    questions.shuffle()

    switch selectedQuestions {
    case .five:
      return Array(questions[..<5])
    case .ten:
      return Array(questions[..<10])
    case .twenty:
      if questions.count >= 20 {
          return Array(questions[..<20])
      } else {
          var repeatedArray = [[Question]](repeating: questions, count: 3).flatMap { $0 }
          repeatedArray.shuffle()
          return Array(repeatedArray[..<20])
      }
    case .all:
      return questions
    }
  }
}

struct OptionButton: View {
  var number: Int
  var isCorrect: Bool
  var delegate: ((Int) -> Void)? = nil

  let customGreenColor: Color = Color(red: 0, green: 200, blue: 0)
  let customRedColor: Color = Color(red: 200, green: 0, blue: 0)

  @State private var animationAmount: CGFloat = 0.01
  @State private var answerColor: Color = .clear

  var customPadding: CGFloat {
    return number < 10 ? 25 : 20
  }

  var body: some View {
    Button("\(number)") {
      withAnimation(Animation.easeOut(duration: 0.5)) {
        animationAmount = 2
        answerColor = isCorrect ? customGreenColor : customRedColor
        self.delegate?(self.number)
      }
    }
    .padding(customPadding)
    .background(Color.purple)
    .foregroundColor(.white)
    .clipShape(Circle())
    .overlay(
      Circle()
        .stroke(answerColor)
        .scaleEffect(animationAmount)
        .opacity(Double(2 - animationAmount))
    )
  }
}
