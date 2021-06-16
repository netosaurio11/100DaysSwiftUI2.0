//
//  ContentView.swift
//  Moonshot
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 15/06/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List(0..<100) { row in
        NavigationLink(destination: Text("Detail view")) {
          Text("Row \(row)")
        }
      }
      .navigationBarTitle("SwiftUI")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
