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
        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        
        let date = Calendar.current.date(from: components) ?? Date()
        
        return DatePicker("Please enter a date", selection: $wakeUp)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
