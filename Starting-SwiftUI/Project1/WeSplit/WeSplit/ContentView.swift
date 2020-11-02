//
//  ContentView.swift
//  WeSplit
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 02/11/20.
//  Copyright © 2020 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
