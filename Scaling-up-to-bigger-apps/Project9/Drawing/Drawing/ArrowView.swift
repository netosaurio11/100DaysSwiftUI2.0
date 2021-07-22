//
//  ArrowView.swift
//  Drawing
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 21/07/21.
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

struct ArrowView: View {
  @State private var linewidth: CGFloat = 3

  var body: some View {
    Arrow(lineWidth: linewidth)
      .foregroundColor(.purple)
      .frame(width: 300, height: 500)
      .onAppear {
        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
          self.linewidth = 15
        }
      }
      .navigationBarTitle("Challenges 1 & 2 - Arrow", displayMode: .inline)
  }
}

struct ArrowView_Previews: PreviewProvider {
  static var previews: some View {
    ArrowView()
  }
}
