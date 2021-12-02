//
//  UsersView.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 15/11/21.
//

import SwiftUI

struct UsersListView: View {
  @State private var users: [Person] = []
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(sortDescriptors: [])
  var usersDBO: FetchedResults<UserDBO>

  var body: some View {
    NavigationView {
      List(users, id: \.id) { user in
        NavigationLink(destination: DetailFriendView(user: User(from: user))) {
          ItemUserView(name: user.name, age: user.age)
        }
      }
      .navigationBarTitle("Users", displayMode: .large)
    }
    .onAppear(perform: loadData)
  }

  func loadData() {
    guard usersDBO.isEmpty else { return }

    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
      print("Invalid URL")
      return
    }

    let request = URLRequest(url: url)

    URLSession.shared.dataTask(with: request) { data, response, error in
      if let data = data {
        if let decodedResponse = try? JSONDecoder().decode([Person].self, from: data) {
          DispatchQueue.main.async {
            self.users = decodedResponse
          }

          return
        }
      }

      // if we're still here it means there was a problem
      print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
    }.resume()
  }

  func saveData() {
    for user in users {
      let userDBO = UserDBO(context: moc)
      userDBO.id = user.id
      userDBO.isActive = user.isActive
      userDBO.name = user.name
      userDBO.age = Int16(user.age)
      userDBO.company = user.company
      userDBO.email = user.email
      userDBO.address = user.address
      userDBO.about = user.about
      userDBO.registered = user.registered

      try? moc.save()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    UsersListView()
  }
}
