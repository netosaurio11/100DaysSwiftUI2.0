//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 04/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            self.useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
