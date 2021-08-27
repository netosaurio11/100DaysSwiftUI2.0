//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 27/08/21.
//

import SwiftUI

struct AddressView: View {
  @ObservedObject var order: Order

  var body: some View {
    Form {
      Section {
        TextField("Name", text: $order.name)
        TextField("Street Address", text: $order.streetAddress)
        TextField("City", text: $order.city)
        TextField("Zip", text: $order.zip)
      }

      Section {
        NavigationLink(destination: CheckoutView(oder: order)) {
          Text("Checkout")
        }
      }
      .disabled(!order.hasValidAddress)
    }
    .navigationBarTitle("Delivery details", displayMode: .inline)
  }
}

struct AddressView_Previews: PreviewProvider {
  static var previews: some View {
    AddressView(order: Order())
  }
}
