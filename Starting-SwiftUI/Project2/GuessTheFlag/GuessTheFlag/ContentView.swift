//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 18/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    // Var used for challenge point #3 message for tell them their mistake
    @State private var scoreMessage = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    // var used for challenge point #1 & #2
    @State private var userScore = 0
    
    // Sucess messages
    private let sucessMessages: [String] = ["Great work!", "Well done!", "Wow! Your Knowledge is awesome."]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                // Flags
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(imageName: self.countries[number])
                    }
                }
                
                Text("Your score: \(userScore)")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            let restarButton: Alert.Button = .default(Text("Restart")) {
                self.restartGame()
            }
            let continueButton: Alert.Button = .default(Text("Continue")) {
                self.askQuestion()
            }
            return Alert(title: Text(scoreTitle), message: Text(scoreMessage), primaryButton: restarButton, secondaryButton: continueButton)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            userScore += 1
            scoreMessage = sucessMessages.randomElement() ?? ""
        } else {
            scoreTitle = "Wrong 🤡"
            scoreMessage = "Thats the flag of \(countries[number])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        askQuestion()
        userScore = 0
    }
}

// MARK: Day 24. Challenge day. FlagImage() implementation
struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(self.imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
