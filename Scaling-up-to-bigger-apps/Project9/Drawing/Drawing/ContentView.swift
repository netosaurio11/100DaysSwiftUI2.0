//
//  ContentView.swift
//  Drawing
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 29/06/21.
//

import SwiftUI

struct Checkerboard: Shape {
  var rows: Int
  var columns: Int

  public var animatableData: AnimatablePair<Double, Double> {
    get {
      AnimatablePair(Double(rows), Double(columns))
    }

    set {
      self.rows = Int(newValue.first)
      self.columns = Int(newValue.second)
    }
  }

  func path(in rect: CGRect) -> Path {
    var path = Path()

    // figure out how big each row/column needs to be
    let rowSize = rect.height / CGFloat(rows)
    let columnSize = rect.width / CGFloat(columns)

    // loop over all rows and columns, making alternating squares colored
    for row in 0..<rows {
      for column in 0..<columns {
        if (row + column).isMultiple(of: 2) {
          // this square should be colored; add a rectangle here
          let startX = columnSize * CGFloat(column)
          let startY = rowSize * CGFloat(row)

          let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
          path.addRect(rect)
        }
      }
    }

    return path
  }
}

struct Arrow: Shape {
  var amount: CGFloat

  func path(in rect: CGRect) -> Path {
    var path = Path()

    path.move(to: CGPoint(x: rect.midX, y: 0))
    path.addLine(to: CGPoint(x: 0, y: rect.maxY * 1 / 4))
    path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY * 1 / 4))
    path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.maxX * 2 / 3, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.maxX * 2 / 3, y: rect.maxY * 1 / 4))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 1 / 4))
    path.addLine(to: CGPoint(x: rect.midX, y: 0))
    return path
  }


}

struct ContentView: View {
  @State private var rows = 4
  @State private var columns = 4

  var body: some View {
    Arrow(amount: 10)
      .fill(Color.red)
      .frame(width: 200, height: 300)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
