//
//  ContentView.swift
//  WeSplit
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 02/11/20.
//  Copyright © 2020 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students: [String] = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose student # \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
