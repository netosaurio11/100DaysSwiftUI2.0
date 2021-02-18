//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 17/02/21.
//

import SwiftUI

struct ContentView: View {
    let options: [OptionGame] = [.rock, .paper, .scissors]
    
    @State private var appCurrentChoice: Int = Int.random(in: 0...2)
    @State private var shouldWin: Bool = Bool.random()

    var body: some View {
        VStack(spacing: 30.0) {
            // VStack to show correct choice
            VStack {
                if shouldWin {
                    Text("You have to WIN againts: ")
                } else {
                    Text("You have to LOSE againts: ")
                }
                Text(options[appCurrentChoice].rawValue)
                    .font(.largeTitle)
                
            }
            
            HStack(spacing: 20.0) {
                // Buttons
                ForEach(0..<options.count) { option in
                    Button(action: {
                        // Button tapped
                    }) {
                        Text(options[option].emoji)
                            .font(.largeTitle)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
