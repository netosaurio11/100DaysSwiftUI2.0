//
//  AddBookView.swift
//  Bookworm
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 20/09/21.
//

import SwiftUI

struct AddBookView: View {

  @Environment(\.managedObjectContext) var moc
  @Environment(\.presentationMode) var presentationMode

  @State private var title = ""
  @State private var author = ""
  @State private var rating = 3
  @State private var genre = ""
  @State private var review = ""

  @State private var showAlert = false

  let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

  var body: some View {
    NavigationView {
      Form {
        // Section1
        Section {
          TextField("Name of book", text: $title)
          TextField("Author's name", text: $author)

          Picker("Genre", selection: $genre) {
            ForEach(genres, id: \.self) { Text($0) }
          }
        }

        //Section 2
        Section {
          RatingView(rating: $rating)
          TextField("Write a review", text: $review)
        }

        // Section 3
        Section {
          Button("Save") {
            validatingData()
          }
        }
      }
      .navigationBarTitle("Add Book")
      .alert(isPresented: $showAlert) {
        Alert(title: Text("Error"), message: Text("You should fill all data."), dismissButton: .default(Text("Ok")))
      }
    }
  }

  private func validatingData() {
    let isFormCompleted: Bool = !title.isEmpty && !author.isEmpty && !genre.isEmpty && !review.isEmpty
    guard isFormCompleted else {
      showAlert = true
      return
    }
    savingData()
  }

  private func savingData() {
    let newBook = Book(context: self.moc)
    newBook.title = self.title
    newBook.author = self.author
    newBook.rating = Int16(self.rating)
    newBook.genre = self.genre
    newBook.review = self.review
    newBook.date = Date()

    try? self.moc.save()
    self.presentationMode.wrappedValue.dismiss()
  }
}

struct AddBookView_Previews: PreviewProvider {
  static var previews: some View {
    AddBookView()
  }
}
