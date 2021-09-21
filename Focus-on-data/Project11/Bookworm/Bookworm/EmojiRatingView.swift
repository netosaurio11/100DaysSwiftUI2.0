//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 20/09/21.
//

import SwiftUI

struct EmojiRatingView: View {
  let rating: Int16

  var body: some View {
    switch rating {
    case 1:
      return Text("🙂")
    case 2:
      return Text("😌")
    case 3:
      return Text("😃")
    case 4:
      return Text("🤯")
    default:
      return Text("🥵")
    }
  }
}

struct EmojiRatingView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiRatingView(rating: 3)
  }
}
