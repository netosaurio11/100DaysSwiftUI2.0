//
//  ContentView.swift
//  Bookworm
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 09/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(entity: Book.entity(), sortDescriptors: [
    NSSortDescriptor(keyPath: \Book.title, ascending: true),
    NSSortDescriptor(keyPath: \Book.author, ascending: true)
  ])
  var books: FetchedResults<Book>

  @State private var showingAddScreen = false

  var body: some View {
    NavigationView {
      List {
        ForEach(books, id: \.self) { book in
          NavigationLink(destination: DetailView(book: book)) {
            EmojiRatingView(rating: book.rating)
              .font(.largeTitle)

            VStack(alignment: .leading) {
              Text(book.title ?? "Unknown title")
                .font(.headline)
                .foregroundColor(book.rating <= 1 ? Color.red : nil)
              Text(book.author ?? "Unkwon Author")
                .foregroundColor(.secondary)
            }
          }
        }
        .onDelete(perform: deleteBooks)
      }
        .navigationBarTitle("Bookworm")
      .navigationBarItems(leading: EditButton(), trailing: Button(action: {
          self.showingAddScreen.toggle()
        }) {
          Image(systemName: "plus")
        })
        .sheet(isPresented: $showingAddScreen) {
          AddBookView().environment(\.managedObjectContext, self.moc)
        }
    }
  }

  func deleteBooks(at offsets: IndexSet) {
    for offset in offsets {
      // Find this book in our fetch request
      let book = books[offset]

      // Delete it from the context
      moc.delete(book)
    }

    // Save the context
    try? moc.save()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
