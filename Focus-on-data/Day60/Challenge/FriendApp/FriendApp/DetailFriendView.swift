//
//  DetailFriendView.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 24/11/21.
//

import SwiftUI

struct DetailFriendView: View {
  let user: User

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
            Text("Name: \(user.name)")
              .font(.headline)
            Text("Age: \(user.age) years old")
              .font(.subheadline)
            Text("Email: \(user.email)")
              .font(.subheadline)
          }

//          VStack(alignment: .leading) {
//            Text(user.company)
//              .font(.headline)
//            Text("\(user.registered) years old")
//              .font(.subheadline)
//            Text("\(user.address) years old")
//              .font(.subheadline)
//          }
          
        }
      }
    }
  }
}

struct DetailFriendView_Previews: PreviewProvider {
  static var previews: some View {
    DetailFriendView(user: User())
  }
}
