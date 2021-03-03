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
    @State private var showingAnswer = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var userScore = 0

    var body: some View {
        VStack(spacing: 30.0) {
            // VStack to show correct choice
            VStack {
                Text("Select a move to \( shouldWin ? "WIN" : "LOSE") againts: ")
                Text(options[appCurrentChoice].rawValue)
                    .font(.largeTitle)
                
            }
            
            HStack(spacing: 20.0) {
                // Buttons
                ForEach(0..<options.count) { option in
                    Button(action: {
                        optionTapped(option)
                    }) {
                        Text(options[option].emoji)
                            .font(.system(size: 60, weight: .semibold, design: .rounded))
                            .padding(8)
                    }
                }
            }
            VStack {
                Text("Your Score: \(userScore)")
                Button("Restart") {
                    self.restartGame()
                }
            }
        }
        .alert(isPresented: $showingAnswer) {
            let okButton = Alert.Button.default(Text("Ok")) {
                self.askForNewMatch()
            }
            
            return Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: okButton)
        }
    }
    
    func askForNewMatch() {
        appCurrentChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func optionTapped(_ number: Int) {
        let correctAnswer: OptionGame = shouldWin ? options[appCurrentChoice].winningOption : options[appCurrentChoice].losingOption
        
        if options[number] == correctAnswer {
            alertTitle = "Correct! ✅"
            alertMessage = "Well done. Nice move 😜"
            userScore += 1
        } else {
            alertTitle = "Wrong! ❌"
            alertMessage = "Check twice your answer! "
        }
        
        showingAnswer = true
    }
    
    func restartGame() {
        askForNewMatch()
        userScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
