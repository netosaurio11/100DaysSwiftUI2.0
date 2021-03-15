//
//  ContentView.swift
//  BetterRest
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 08/03/21.
//

import SwiftUI

struct ContentView: View {
  @State private var wakeUp = Date()
  @State private var sleepAmount = 8.0
  @State private var coffeeAmount = 1

  var body: some View {
    NavigationView {
      VStack {
        Text("When do you want to wake up?")
          .font(.headline)

        DatePicker("Please entera time", selection: $wakeUp, displayedComponents: .hourAndMinute)
          .labelsHidden()

        Text("Desired amount of sleep")
          .font(.headline)
        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
          Text("\(sleepAmount, specifier:  "%g") hours")
        }

        Text("Daily coffe instake")
          .font(.headline)
        Stepper(value: $coffeeAmount, in: 1...20) {
          coffeeAmount == 1 ? Text("1 cup") : Text("\(coffeeAmount) cups")
        }
      }
      .navigationBarTitle("BetterRest")
      .navigationBarItems(trailing:
                            Button(action: calculateBedTime) {
                              Text("Calculate")
                            }
      )
    }
  }

  func calculateBedTime() {

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
