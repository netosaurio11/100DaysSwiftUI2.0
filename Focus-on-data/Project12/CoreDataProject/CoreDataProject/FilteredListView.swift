//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 12/10/21.
//

import SwiftUI
import CoreData

struct FilteredListView<T: NSManagedObject, Content: View>: View {
  var fetchRequest: FetchRequest<T>

  // this is our content closure; we'll call this once for each item in the list
  let content: (T) -> Content

  init(filterKey: String, filterValue: String,  @ViewBuilder content: @escaping (T) -> Content) {
    fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
    self.content = content
  }

  var body: some View {
    List(fetchRequest.wrappedValue, id: \.self) { item in
      self.content(item)
    }
  }
}
