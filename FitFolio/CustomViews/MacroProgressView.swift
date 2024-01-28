//
//  MacroProgressView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2024-01-27.
//

import SwiftUI

struct MacroProgressView: View {
    let weeklyProgress: [[CGFloat]]
    
    var body: some View {
        ForEach(0..<weeklyProgress.count, id: \.self) { progressIndex in
            generateAProgressBarRow(weeklyProgress: weeklyProgress[progressIndex], color: getColor(forIndex: progressIndex))
                    }

        // Call the function with the weekly progress array
    } // body
    
    private func generateAProgressBarRow(weeklyProgress: [CGFloat], color: Color) -> some View {
        HStack {
            ForEach(0..<7) { dayIndex in
                ProgressView(value: weeklyProgress[dayIndex])
                    .progressViewStyle(LinearProgressViewStyle(tint: color))
                    .padding()
                    .scaleEffect(1.5)
                    .rotationEffect(.degrees(270))
                }
            }
    } // generateProgressBarRows

    private func getColor(forIndex index: Int) -> Color {
        switch index {
        case 0:
            return .blue // Calories
        case 1:
            return .green // Fats
        case 2:
            return .orange // Carbs
        case 3:
            return .red // Protein
        default:
            return .black
        }
    }
    
} // MacroProgressView



#Preview {
    MacroProgressView(weeklyProgress: [
        [0.2, 0.5, 0.8, 0.3, 0.0, 0.0, 0.0], // Weekly Calories
        [0.3, 0.6, 0.7, 0.2, 0.0, 0.0, 0.0], // Weekly Fats
        [0.4, 0.7, 0.5, 0.4, 0.0, 0.0, 0.0], // Weekly Carbs
        [0.1, 0.4, 0.6, 0.8, 0.0, 0.0, 0.0]  // Weekly Protein
    ])
}
