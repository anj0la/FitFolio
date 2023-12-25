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
    let intake: String
    let intakeTarget: String
    let intakeUnits: String
    let intakeColor: Color
    
    var body: some View {
      ZStack {
          // Background for the progress bar
          Circle().stroke(
            intakeColor.opacity(0.3),
            lineWidth: circleWidth
          )
          // Foreground or the actual progress bar
          Circle()
              .trim(from: 0.0, to: min(progress, 1.0))
              .stroke(
                intakeColor,
                style: StrokeStyle(
                    lineWidth: circleWidth,
                    lineCap: .round
                )
              )
              .rotationEffect(Angle(degrees: 270.0))
              .animation(.linear, value: progress)
          // Text for the progress view
          VStack {
              HStack {
                  Text(intake)
                  Text(intakeUnits).font(.caption2).padding(.top, 5).padding(.leading, -5)
              }.font(.system(size: 18))
              Text("out of " + intakeTarget).font(.system(size: 8))
    
          }
      } // ZStack
  } // body
} // CircularProgressView


#Preview {
    CircularProgressView(progress: 0.2, circleWidth: 30, intake: String(1700), intakeTarget: String(2300), intakeUnits: "kcal", intakeColor: Color.green)
}
