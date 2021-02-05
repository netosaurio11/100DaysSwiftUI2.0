//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 04/02/21.
//

import SwiftUI

struct ContentView: View {
    var motto1: some View { Text("Draco dormiens") }
    var motto2: some View { Text("nunquam titillandus") }

    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
