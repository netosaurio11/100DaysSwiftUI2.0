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
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image("cupcakes")
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width)

          Text("Your total is $\(self.oder.cost, specifier: "%.2f")")
            .font(.title)

          Button("Place Order") {
            // Place order
          }
          .padding()
        }
      }
    }
    .navigationBarTitle("Checkout", displayMode: .inline)
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static var previews: some View {
    CheckoutView(oder: Order())
  }
}
