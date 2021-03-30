//
//  ContentView.swift
//  WordScramble
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 29/03/21.
//

import SwiftUI

struct ContentView: View {
  let people = ["Finn", "Leia", "Luke", "Rey"]

  var body: some View {
    let word = "swift"
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    let allGood = misspelledRange.location == NSNotFound
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
