//
//  MacroProgressView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2024-01-27.
//

import SwiftUI

struct MacroProgressView: View {
    let weeklyCaloriesProgress: [CGFloat]
    let weeklyFatsProgress: [CGFloat]
    let weeklyCarbsProgress: [CGFloat]
    let weeklyProteinProgress: [CGFloat]
    
    var body: some View {
        generateAProgressBarRow(weeklyProgress: weeklyCaloriesProgress)
        generateAProgressBarRow(weeklyProgress: weeklyFatsProgress)
        generateAProgressBarRow(weeklyProgress: weeklyCarbsProgress)
        generateAProgressBarRow(weeklyProgress: weeklyProteinProgress)

        // Call the function with the weekly progress array
    } // body
    
    private func generateAProgressBarRow(weeklyProgress: [CGFloat]) -> some View {
        HStack {
            ForEach(0..<7) { dayIndex in
                ProgressView(value: weeklyProgress[dayIndex])
                    .progressViewStyle(LinearProgressViewStyle(tint: .black))
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
    MacroProgressView(weeklyCaloriesProgress: [0.2, 0.4, 0.5, 0.7, 0.0, 0.0, 0.0], weeklyFatsProgress: [0.1, 0.2, 0.3, 0.4, 0.0, 0.0, 0.0], weeklyCarbsProgress:[0.3, 0.1, 0.9, 0.5, 0.0, 0.0, 0.0], weeklyProteinProgress: [0.0, 0.2, 0.8, 0.6, 0.0, 0.0, 0.0])
}
