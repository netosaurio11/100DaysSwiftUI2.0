//
//  ContentView.swift
//  BetterRest
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 08/03/21.
//

import SwiftUI

struct ContentView: View {
  @State private var wakeUp = defaultWakeTime
  @State private var sleepAmount = 8.0
  @State private var coffeeIndex = 1

  private let numberOfCups: [Int] = Array(1...20)

  var body: some View {
    NavigationView {
      Form {
        VStack(alignment: .leading, spacing: 0) {
          Text("Your ideal bedtime is…")
          Text(calculateBedTime())
            .font(.largeTitle)
        }

        Section(header: Text("When do you want to wake up?")) {
          DatePicker("Please entera time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .datePickerStyle(WheelDatePickerStyle())
        }

        Section(header: Text("Desired amount of sleep")) {
          Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
            Text("\(sleepAmount, specifier:  "%g") hours")
          }
        }

        Section(header: Text("Daily coffe intake")) {
          Picker("Number of cups", selection: $coffeeIndex) {
            ForEach(0 ..< numberOfCups.count) {
              self.numberOfCups[$0] == 1 ? Text("\(self.numberOfCups[$0]) cup") : Text("\(self.numberOfCups[$0]) cups")
            }
          }
        }
      }
      .navigationBarTitle("BetterRest")
    }
  }

  static var defaultWakeTime: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    return Calendar.current.date(from: components) ?? Date()
  }

  func calculateBedTime() -> String {
    let model = SleepCalculator()
    let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
    let hour = (components.hour ?? 0) * 60 * 60
    let minute = (components.minute ?? 0) * 60

    do {
      let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(numberOfCups[coffeeIndex]))
      let sleepTime = wakeUp - prediction.actualSleep

      let formatter = DateFormatter()
      formatter.timeStyle = .short
      return formatter.string(from: sleepTime)
    } catch {
      return "Sorry, there was a problem calculating your bedtime."
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
