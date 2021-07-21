//
//  ContentView.swift
//  Drawing
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 29/06/21.
//

import SwiftUI

struct Arrow: InsettableShape {
  var lineWidth: CGFloat
  var insetAmount: CGFloat = 0

  var animatableData: CGFloat{
    get { lineWidth }
    set { self.lineWidth = newValue }
  }

  func path(in rect: CGRect) -> Path {
    var path = Path()

    path.move(to: CGPoint(x: rect.midX, y: 0 + insetAmount))
    path.addLine(to: CGPoint(x: 0 + insetAmount, y: rect.maxY / 3))
    path.addLine(to: CGPoint(x: rect.maxX / 4, y: rect.maxY / 3))
    path.addLine(to: CGPoint(x: rect.maxX / 4, y: rect.maxY - insetAmount))
    path.addLine(to: CGPoint(x: rect.maxX * 3 / 4, y: rect.maxY - insetAmount))
    path.addLine(to: CGPoint(x: rect.maxX * 3 / 4, y: rect.maxY / 3))
    path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.maxY / 3))
    path.addLine(to: CGPoint(x: rect.midX, y: 0 + insetAmount))

    let strokedPath = path.strokedPath(StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))

    return strokedPath
  }

  func inset(by amount: CGFloat) -> some InsettableShape {
    var arrow = self
    arrow.insetAmount += amount
    return arrow
  }

}

struct ContentView: View {
  @State private var linewidth: CGFloat = 5

  var body: some View {
    Arrow(lineWidth: linewidth)
      .foregroundColor(.purple)
      .frame(width: 200, height: 300)
      .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
      .onAppear {
        self.linewidth = 15
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
