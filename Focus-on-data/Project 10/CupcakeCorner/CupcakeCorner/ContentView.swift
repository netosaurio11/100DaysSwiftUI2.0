//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 25/08/21.
//

import SwiftUI

struct Response: Codable {
  var results: [Result]
}

struct Result: Codable {
  var trackId: Int
  var trackName: String
  var collectionName: String
}

struct ContentView: View {
  @State private var results = [Result]()

  var body: some View {
    List(results, id: \.trackId) { item in
      VStack(alignment: .leading) {
        Text(item.trackName)
          .font(.headline)
        Text(item.collectionName)
      }
    }
    .onAppear(perform: loadData)
  }

  func loadData() {
    // 1.Creating the URL we want to read.
    guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else { return }

    //2.Wrapping that in a URLRequest, which allows us to configure how the URL should be accessed.
    let request = URLRequest(url: url)

    //3.Create and start a networking task from that URL request.
    URLSession.shared.dataTask(with: request) { data, response, error in
      //4.Handle the result of that networking task.
      if let data = data {
        if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
          // we have good data – go back to the main thread
          DispatchQueue.main.async {
            // update our UI
            self.results = decodedResponse.results
          }

          // everything is good, so we can exit
          return
        }
      }

      // if we're still here it means there was a problem
      print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
    }.resume()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
