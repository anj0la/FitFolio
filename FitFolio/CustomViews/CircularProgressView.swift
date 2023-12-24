//
//  CircularProgressView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-23.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: CGFloat
    let circleWidth: CGFloat
    
    var body: some View {
      ZStack {
          // Background for the progress bar
          Circle().stroke(
            Color.green.opacity(0.3),
            lineWidth: circleWidth
          )
          // Foreground or the actual progress bar
          Circle()
              .trim(from: 0.0, to: min(progress, 1.0))
              .stroke(
                Color.green,
                style: StrokeStyle(
                    lineWidth: circleWidth,
                    lineCap: .round
                )
              )
              .rotationEffect(Angle(degrees: 270.0))
              .animation(.linear, value: progress)
      } // ZStack
  } // body
} // CircularProgressView


#Preview {
    CircularProgressView(progress: 0.2, circleWidth: 30)
}
