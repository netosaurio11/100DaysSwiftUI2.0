//
//  ContentView.swift
//  WeSplit
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 02/11/20.
//  Copyright © 2020 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
