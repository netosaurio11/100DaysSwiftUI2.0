//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 02/06/21.
//

import Foundation

struct ExpenseItem {
  let name: String
  let type: String
  let amount: Int
}

class Expenses: ObservableObject {
  @Published var items = [ExpenseItem]()
}
