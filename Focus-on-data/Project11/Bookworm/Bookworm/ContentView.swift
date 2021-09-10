//
//  ContentView.swift
//  Bookworm
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 09/09/21.
//

import SwiftUI

struct ContentView: View {
  @State private var rememberMe = false

  var body: some View {
    VStack {
      PushButton(title:"Remember Me", isOn: $rememberMe)
      Text(rememberMe ? "On": "Off")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct PushButton: View {
  let title: String
  @Binding var isOn: Bool

  var onColors = [Color.green, Color.blue ]
  var offColors = [Color(white: 0.6), Color(white: 0.4)]

  var body: some View {
    Button(title) {
      self.isOn.toggle()
    }
    .padding()
    .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
    .foregroundColor(.white)
    .clipShape(Capsule())
    .shadow(radius: isOn ? 0 : 5)
  }
}