//
//  CrewMember.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 21/06/21.
//

import Foundation
import SwiftUI

struct CrewMember {
  let role: String
  let astronaut: Astronaut

  var foreGroundColor: Color {
    switch  role {
    case "Commander":
      return .green
    default:
      return .secondary
    }
  }
}
