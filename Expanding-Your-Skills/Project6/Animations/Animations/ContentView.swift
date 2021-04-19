//
//  ContentView.swift
//  Animations
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 19/04/21.
//

import SwiftUI

struct ContentView: View {
  // MARK: Properties
  @State private var animationAmount: CGFloat = 1

    var body: some View {
      Button("Tap Me") {
        self.animationAmount += 1
      }
      .padding(50)
      .background(Color.red)
      .foregroundColor(.white)
      .clipShape(Circle())
      .scaleEffect(animationAmount)
      .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
