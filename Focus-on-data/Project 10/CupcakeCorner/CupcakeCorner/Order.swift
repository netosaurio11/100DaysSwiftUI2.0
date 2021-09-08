//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 27/08/21.
//

import Foundation

struct OrderData: Codable {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

  enum CodingKeys: CodingKey {
    case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
  }

  var type: Int = 0
  var quantity: Int = 3
  var specialRequestEnabled: Bool = false {
    didSet {
      if !specialRequestEnabled {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  var extraFrosting: Bool = false
  var addSprinkles: Bool = false

  var name: String = ""
  var streetAddress: String = ""
  var city: String = ""
  var zip: String = ""

  var hasValidAddress: Bool {
    let trimmedName = name.trimmingCharacters(in: .whitespaces)
    let trimmedStreetAddress = streetAddress.trimmingCharacters(in: .whitespaces)
    let trimmedCity = city.trimmingCharacters(in: .whitespaces)
    let trimmedZip = zip.trimmingCharacters(in: .whitespaces)

    if trimmedName.isEmpty || trimmedStreetAddress.isEmpty || trimmedCity.isEmpty || trimmedZip.isEmpty {
      return false
    }

    return true
  }

  var cost: Double {
    // $2 per cake
    var cost = Double(quantity) * 2

    // complicated cakes cost more
    cost += (Double(type) / 2)

    // $1/cake for extra frosting
    if extraFrosting {
      cost += Double(quantity)
    }

    // $0.50/cake for sprinkles
    if addSprinkles {
      cost += Double(quantity) / 2
    }

    return cost
  }
}

class Order: ObservableObject {
  @Published var data: OrderData = OrderData()
}
