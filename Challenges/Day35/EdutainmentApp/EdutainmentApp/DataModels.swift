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

enum GameMode: Int {
  case simple = 0
  case multiple

  var description: String {
    switch self {
    case .simple:
      return "Simple"
    case .multiple:
      return "Multiple"
    }
  }
}
