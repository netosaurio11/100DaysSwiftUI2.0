//
//  ContentView.swift
//  BetterRest
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 08/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()

    var body: some View {
        return DatePicker("Please enter a date", selection: $wakeUp)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
