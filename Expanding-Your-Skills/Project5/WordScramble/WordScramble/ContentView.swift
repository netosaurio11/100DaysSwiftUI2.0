//
//  ContentView.swift
//  WordScramble
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 29/03/21.
//

import SwiftUI

struct ContentView: View {
  @State private var usedWords = [String]()
  @State private var rootWord = ""
  @State private var newWord = ""

  @State private var errorTitle = ""
  @State private var errorMessage = ""
  @State private var showingError = false

  var body: some View {
    NavigationView {
      VStack {
        TextField("Enter your word", text: $newWord, onCommit: addNewWord)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocapitalization(.none)
          .padding()

        List(usedWords, id: \.self) {
          Image(systemName: "\($0.count).circle")
          Text($0)
        }
        HStack {
          Text("Words: \(usedWords.count)")
          Text("Words score: \(getScoreOfWords())")
        }
        Text("Total: \(usedWords.count + getScoreOfWords())")
      }
      .navigationBarTitle(rootWord)
      .onAppear(perform: startGame)
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Restart") {
            self.restartGame()
          }
        }
      })
      .alert(isPresented: $showingError) {
        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("ok")))
      }
    }
  }

  func addNewWord() {
    // lowercase and trim the word, to make sure we don't add duplicate words with case differences
    let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

    // exit if the remaining string is empty
    guard answer.count > 0 else { return }

    guard isOriginal(word: answer) else {
        wordError(title: "Word used already", message: "Be more original")
        return
    }

    guard isPossible(word: answer) else {
        wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
        return
    }

    guard isReal(word: answer) else {
        wordError(title: "Word not possible", message: "That isn't a real word.")
        return
    }

    guard isChallengeCase(word: answer) else {
      wordError(title: "Word not valid", message: "Shoul have more thant 3 letters of be different than original.")
      return
    }

      usedWords.insert(answer, at: 0)
      newWord = ""
  }

  func startGame() {
    guard let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"), let startWords = try? String(contentsOf: startWordsURL) else { fatalError("Could not load start.txt from bundle.") }

    let allWords = startWords.components(separatedBy: "\n")
    rootWord = allWords.randomElement() ?? "silkworm"
  }

  func isOriginal(word: String) -> Bool {
    !usedWords.contains(word)
  }

  func isPossible(word: String) -> Bool {
    var tempWord = rootWord

    for letter in word {
      guard let pos = tempWord.firstIndex(of: letter) else { return false }
      tempWord.remove(at: pos)
    }
    return true
  }

  func isReal(word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)

    let missPelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

    return missPelledRange.location == NSNotFound
  }

  func isChallengeCase(word: String) -> Bool {
    // Just words with more than 3 letters are reals
    // Or if the input word and root word are the same
    return word.count > 3 && !word.elementsEqual(rootWord)
  }

  func wordError(title: String, message: String) {
      errorTitle = title
      errorMessage = message
      showingError = true
  }

  func restartGame() {
    usedWords.removeAll()
    startGame()
  }

  func getScoreOfWords() -> Int {
    let score = usedWords.map { $0.count }
    return score.reduce(0) { (x, y) in
      x + y
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
