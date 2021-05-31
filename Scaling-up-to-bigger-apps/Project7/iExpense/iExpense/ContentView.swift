//
//  ContentView.swift
//  iExpense
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 31/05/21.
//

import SwiftUI

struct SecondView: View {
  @Environment(\.presentationMode) var presentationMode
  var name: String

  var body: some View {
    Button("Dismiss") {
      self.presentationMode.wrappedValue.dismiss()
    }
  }
}

struct ContentView: View {
  @State private var showingSheet = false

  var body: some View {
    Button("Show Sheet") {
      self.showingSheet.toggle()
    }
    .sheet(isPresented: $showingSheet) {
      SecondView(name: "@la__presion")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
