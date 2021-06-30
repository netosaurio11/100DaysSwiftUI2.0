//
//  ContentView.swift
//  Drawing
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 29/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      Path { path in
        path.move(to: CGPoint(x: 150, y: 100))
        path.addLine(to: CGPoint(x: 50, y: 300))
        path.addLine(to: CGPoint(x: 250, y: 300))
        path.addLine(to: CGPoint(x: 150, y: 100))
      }
      .stroke(Color.blue.opacity(0.25) , style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
