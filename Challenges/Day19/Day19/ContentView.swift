//
//  ContentView.swift
//  Day19
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 14/12/20.
//

import SwiftUI

struct ContentView: View {
    @State private var inputAmount: String = ""
    @State private var inputUnit: Int = 0
    @State private var outputUnit: Int = 1
    
    let temperatureUnitsPicker: [String] = ["°C", "°F", "°K"]
    let temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    
    var convertedResult: Double {
        let amount: Double = Double(inputAmount) ?? 0.0
        let inputUnitAmount: Measurement = Measurement(value: amount, unit: temperatureUnits[inputUnit])
        
        let commonTemperature = inputUnitAmount.converted(to: .celsius)
        
        let outputUnitAmount = commonTemperature.converted(to: temperatureUnits[outputUnit])
        
        return outputUnitAmount.value
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // Input Data
                    TextField("Input amount", text: $inputAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< temperatureUnitsPicker.count) {
                            Text(temperatureUnitsPicker[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // Output data
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< temperatureUnits.count) {
                            Text(temperatureUnitsPicker[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("\(convertedResult, specifier: "%.2f") \(temperatureUnitsPicker[outputUnit])")
                }
            }
            .navigationTitle("Unit converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
