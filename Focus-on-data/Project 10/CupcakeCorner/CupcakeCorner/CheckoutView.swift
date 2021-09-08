//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 27/08/21.
//

import SwiftUI

struct CheckoutView: View {
  @ObservedObject var order: Order

  @State private var confirmationMessage = ""
  @State private var alertTitle = ""
  @State private var showingConfirmation = false


  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image("cupcakes")
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width)

          Text("Your total is $\(self.order.data.cost, specifier: "%.2f")")
            .font(.title)

          Button("Place Order") {
            self.placeOrder()
          }
          .padding()
        }
      }
    }
    .navigationBarTitle("Checkout", displayMode: .inline)
    .alert(isPresented: $showingConfirmation) {
      Alert(title: Text(alertTitle), message: Text(confirmationMessage), dismissButton: .default(Text("Ok")))
    }
  }

  func placeOrder() {
    guard let encoded = try? JSONEncoder().encode(order.data) else {
      print("Failed to encode order")
      return
    }

    let url = URL(string: "https://reqres.in/api/cupcakes")!
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    request.httpBody = encoded

    URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        let errorDescription = error?.localizedDescription ?? "Try later"
        self.alertTitle = "Error!"
        self.confirmationMessage = "Something went wrong: \(errorDescription)"
        self.showingConfirmation = true
        return
      }

      if let decodedOrder = try? JSONDecoder().decode(OrderData.self, from: data) {
        self.alertTitle = "Thank you!"
        self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(OrderData.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
        self.showingConfirmation = true
      } else {
        let errorDescription = error?.localizedDescription ?? "Try later"
        self.alertTitle = "Error!"
        self.confirmationMessage = "Something went wrong: \(errorDescription)"
        self.showingConfirmation = true
      }
    }.resume()
  }
}

struct CheckoutView_Previews: PreviewProvider {
  static var previews: some View {
    CheckoutView(order: Order())
  }
}
