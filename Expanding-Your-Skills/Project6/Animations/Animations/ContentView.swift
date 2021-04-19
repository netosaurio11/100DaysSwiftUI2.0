//
//  ContentView.swift
//  Animations
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 19/04/21.
//

import SwiftUI

struct ContentView: View {

  @State private var animationAmount = 0.0

  var body: some View {
    Button("Tap Me") {
      withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
        self.animationAmount += 360
      }
    }
    .padding(50)
    .background(Color.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 1))
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
