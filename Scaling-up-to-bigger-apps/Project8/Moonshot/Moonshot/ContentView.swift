//
//  ContentView.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 15/06/21.
//

import SwiftUI

struct CustomText: View {
  var text: String

  var body: some View {
    Text(text)
  }

  init(_ text: String) {
    print("Creating a new CustomText")
    self.text = text
  }
}

struct ContentView: View {
  var body: some View {
    List {
      ForEach(0..<100) {
        CustomText("Item \($0)")
          .font(.title)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
