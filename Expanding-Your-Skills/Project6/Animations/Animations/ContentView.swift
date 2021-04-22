//
//  ContentView.swift
//  Animations
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 19/04/21.
//

import SwiftUI

struct ContentView: View {

  @State private var isShowingRed = false

  var body: some View {
    VStack {
      Button("Tap Me") {
        withAnimation {
          self.isShowingRed.toggle()
        }
      }

      if isShowingRed {
        Rectangle()
          .fill(Color.red)
          .frame(width: 100, height: 100)
          .transition(.pivot)
      }
    }
  }
}

struct CornerRotateModifier: ViewModifier {
  let amount: Double
  let anchor: UnitPoint

  func body(content: Content) -> some View {
    content.rotationEffect(.degrees(amount), anchor: anchor)
      .clipped()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
  static var pivot: AnyTransition {
    .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
  }
}
