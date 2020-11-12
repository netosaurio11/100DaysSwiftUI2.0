//
//  ContentView.swift
//  WeSplit
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 02/11/20.
//  Copyright © 2020 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: String = ""
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 2
    
    let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount: Double = Double(numberOfPeople + 2)
        let tipSelection: Double = Double(tipPercentages[tipPercentage])
        let orderAmount: Double = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Amount and number of people
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                // Tip percentages
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }

                // Final result
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
