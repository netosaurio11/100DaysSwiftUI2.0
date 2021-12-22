//
//  ItemUserView.swift
//  FriendApp
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 22/11/21.
//

import SwiftUI

struct ItemUserView: View {

  let name: String
  let age: Int?

  var body: some View {
    HStack {
      Image.init(systemName: "person.crop.circle.fill")
        .scaledToFit()
        .clipShape(Capsule())

      VStack(alignment: .leading) {
        Text(name)
          .font(.headline)

        if age != nil {
          Text("\(age!) years old")
            .font(.subheadline)
        }
      }
      Spacer()
      .multilineTextAlignment(.leading)
    }
  }
}

extension ItemUserView {
  init(name: String) {
    self.name = name
    self.age = nil
  }
}

struct ItemUserView_Previews: PreviewProvider {
  static var previews: some View {
    ItemUserView(name: "", age: 0)
  }
}
