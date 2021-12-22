//
//  DetailFriendView.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 24/11/21.
//

import SwiftUI
import CoreData

struct DetailFriendView: View {
  @Environment(\.managedObjectContext) var moc
  let user: UserDBO

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
            Text(user.wrappedCompany)
              .font(.subheadline)
            Text("Email:")
              .font(.headline)
            Text(user.wrappedEmail)
              .font(.subheadline)
          }
        }
        Text(user.wrappedAbout)
          .padding()

        Text("Friends:")
          .font(.largeTitle)

        ForEach(user.friendsArray, id: \.self) { friend in
          let userDBO = getUserDBO(from: friend)
          NavigationLink(destination: DetailFriendView(user: userDBO)) {
            ItemUserView(name: friend.wrappedName)
          }
          .buttonStyle(PlainButtonStyle())
        }
        Spacer(minLength: 25)
      }
    }
    .navigationBarTitle(user.wrappedName, displayMode: .inline)
  }

  func getUserDBO(from friend: FriendDBO) -> UserDBO {
    let fetchRequest = NSFetchRequest<UserDBO>(entityName: "UserDBO")

    guard let usersDBO = try? moc.fetch(fetchRequest) else { return UserDBO() }

    return usersDBO.first { $0.id == friend.id } ?? UserDBO()

  }
}

struct DetailFriendView_Previews: PreviewProvider {
  static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

  static var previews: some View {
    let user = UserDBO(context: moc)

    user.isActive = false
    user.name = "default name"
    user.age = 0
    user.company = "default company"
    user.email = "default company"
    user.address = "default address"
    user.about = "default about"
    user.registered = "default registered"

    return NavigationView {
      DetailFriendView(user: user)
    }
  }
}
