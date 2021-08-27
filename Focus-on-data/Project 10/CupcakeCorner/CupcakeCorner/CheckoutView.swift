//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 27/08/21.
//

import SwiftUI

struct CheckoutView: View {
  @ObservedObject var oder: Order

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static var previews: some View {
    CheckoutView(oder: Order())
  }
}
