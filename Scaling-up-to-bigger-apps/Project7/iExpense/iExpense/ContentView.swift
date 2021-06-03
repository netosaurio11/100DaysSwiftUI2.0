//
//  ContentView.swift
//  iExpense
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 31/05/21.
//

import SwiftUI


struct ContentView: View {
  @ObservedObject var expenses = Expenses()

  var body: some View {
    NavigationView {
      List {
        ForEach(expenses.items) { item in
          Text(item.name)
        }
        .onDelete(perform: removeItems)
      }
      .navigationBarTitle("iExpense")
      .navigationBarItems(trailing:
                            Button(action: {
                              let expense = ExpenseItem(name: "Test", type: "Personal", amount: 1)
                              self.expenses.items.append(expense)
                            }) {
                              Image(systemName: "plus")
                            }
      )
    }
  }

  func removeItems(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
