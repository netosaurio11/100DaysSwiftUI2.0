//
//  DetailFriendView.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 24/11/21.
//

import SwiftUI

struct DetailFriendView: View {
  @ObservedObject var user: User

  var body: some View {
    ScrollView(.vertical) {
      VStack {
        // Info View
        HStack{
          Image(systemName: "person.crop.circle.fill")
            .resizable()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.orange, lineWidth: 4))

          VStack(alignment: .leading) {
            Text("Age:")
              .font(.headline)
            Text("\(user.age) years old")
              .font(.subheadline)
            Text("Company:")
              .font(.headline)
            Text(user.company)
              .font(.subheadline)
            Text("Email:")
              .font(.headline)
            Text(user.email)
              .font(.subheadline)
          }   
        }
        Text(user.about)
          .padding()
      }
    }
    .navigationBarTitle(user.name, displayMode: .inline)
  }
}

struct DetailFriendView_Previews: PreviewProvider {
  static var previews: some View {
    DetailFriendView(user: User(from: Person()))
  }
}
