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
    @State private var numberOfPeople: String = ""
    @State private var tipPercentage: Int = 2
    
    let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let people: Int = Int(numberOfPeople) ?? 1
        let peopleCount: Double = Double(people)
        let grandTotal = getGrandTotalAmount()
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
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
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
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                // Total amount
                Section(header: Text("Total")) {
                    Text("$\(getGrandTotalAmount(), specifier: "%.2f")") // Total without dividing by the number of people.
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
    
    func getGrandTotalAmount() -> Double {
        let tipSelection: Double = Double(tipPercentages[tipPercentage])
        let orderAmount: Double = Double(checkAmount) ?? 0
        
        let tipValue: Double = orderAmount / 100 * tipSelection
        let grandTotal: Double = orderAmount + tipValue
        
        return grandTotal
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
