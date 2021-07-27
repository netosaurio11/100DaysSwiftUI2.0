//
//  RectangleView.swift
//  Drawing
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 21/07/21.
//

import SwiftUI

struct RectangleView: View {
  @State private var colorCycle = 0.0
  @State private var startPosition = 0
  @State private var endPosition = 1

  private var longLabels: [String] = [
    "Top", "Bottom", "Left", "Right"
  ]

  private var shortLabels: [String] = [
    "T", "B", "L", "R"
  ]

    var body: some View {
      VStack(spacing: 10) {
        ColorCyclingRectangleView(amount: colorCycle, startPointValue: startPosition, endPointValue: endPosition)
          .frame(width: 350, height: 250)

        ScrollView(.vertical) {
          Text("Cycle amount: \(colorCycle,specifier: "%.2f")").font(.headline)
          Slider(value: $colorCycle)

          Text("Start position: \(longLabels[startPosition])").font(.headline)
          Picker("Start position", selection: $startPosition) {
            ForEach(0..<shortLabels.count) { position in
              Text(self.shortLabels[position])
            }
          }
          .labelsHidden()
          .pickerStyle(SegmentedPickerStyle())

          Text("End position: \(longLabels[endPosition])").font(.headline)
          Picker("End position", selection: $endPosition) {
            ForEach(0..<shortLabels.count) { position in
              Text(self.shortLabels[position])
            }
          }
          .labelsHidden()
          .pickerStyle(SegmentedPickerStyle())
        }
      }
    }
}

struct ColorCyclingRectangleView: View {
  var amount = 0.0
  var startPointValue = 0
  var endPointValue = 1
  var steps = 100

  var body: some View {
    ZStack {
      ForEach(0..<steps) { value in
        Rectangle()
          .inset(by: CGFloat(value))
          .strokeBorder(LinearGradient(gradient: Gradient(colors: [
              self.color(for: value, brightness: 1),
              self.color(for: value, brightness: 0.5)
          ]), startPoint: point(for: startPointValue), endPoint: point(for: endPointValue)), lineWidth: 2)
      }
    }
    .drawingGroup()
    .navigationBarTitle("Challenge 3 - Rectangle", displayMode: .inline)
  }

  func color(for value: Int, brightness: Double) -> Color {
    var targetHue = Double(value) / Double(self.steps) + self.amount

    if targetHue > 1 {
      targetHue -= 1
    }

    return Color(hue: targetHue, saturation: 1, brightness: brightness)
  }
  func point(for value: Int) -> UnitPoint {
    switch value {
    case 0:
      return .top
    case 1:
      return .bottom
    case 2:
      return .leading
    case 3:
      return .trailing
    default:
      return .zero
    }
  }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
