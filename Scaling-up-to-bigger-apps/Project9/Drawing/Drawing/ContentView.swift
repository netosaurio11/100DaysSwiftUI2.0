//
//  ContentView.swift
//  Drawing
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 29/06/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: ArrowView()) {
          Text("Arrow")
        }

        NavigationLink(destination: RectangleView()) {
          Text("Rectangle")
        }
      }
      .navigationBarTitle("Day 46. Challenge")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
