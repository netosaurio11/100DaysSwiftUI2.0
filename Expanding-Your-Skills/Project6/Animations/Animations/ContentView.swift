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
          .transition(.asymmetric(insertion: .opacity, removal: .scale))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
