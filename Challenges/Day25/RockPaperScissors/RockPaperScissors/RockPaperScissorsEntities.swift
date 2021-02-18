//
//  RockPaperScissorsEntities.swift
//  RockPaperScissors
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 17/02/21.
//

import Foundation
import SwiftUI

enum OptionGame: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊🏼"
        case .paper:
            return "🖐🏼"
        case .scissors:
            return "✌🏼"
        }
    }
}
