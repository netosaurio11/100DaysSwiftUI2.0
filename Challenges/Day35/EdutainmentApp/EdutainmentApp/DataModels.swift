//
//  DataModels.swift
//  EdutainmentApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 03/05/21.
//

import Foundation

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
      return Array(questions[..<20])
    case .all:
      return questions
    }
  }
}
