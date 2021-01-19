//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 18/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        Button("Show alert!") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello world!"),
                  message: Text("Some detail message"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
