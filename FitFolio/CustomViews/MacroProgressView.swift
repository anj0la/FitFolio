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
        
        VStack(alignment: .leading) {
            ForEach(0..<weeklyProgress.count, id: \.self) { progressIndex in
                generateAProgressBarRow(weeklyProgress: weeklyProgress[progressIndex], color: getColor(forIndex: progressIndex))
                        }
            generateDaysOfTheWeekText()
        } // VStack
        

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
            return .green // Calories
        case 1:
            return .yellow // Fats
        case 2:
            return .cyan // Carbs
        case 3:
            return .purple // Protein
        default:
            return .black
        }
    } // getColor
    
    
    /// Returns an HStack displaying the days of the week.
    ///
    /// - Returns: HStack displaying each day of the week as text.
    private func generateDaysOfTheWeekText() -> some View {
        HStack {
            Text("Mo").font(.caption).bold().padding(.leading, 18)
            Text("Tu").font(.caption).bold().padding(.leading, 29)
            Text("We").font(.caption).bold().padding(.leading, 26)
            Text("Th").font(.caption).bold().padding(.leading, 28)
            Text("Fr").font(.caption).bold().padding(.leading, 30)
            Text("Sa").font(.caption).bold().padding(.leading, 30)
            Text("Su").font(.caption).bold().padding(.leading, 32)
        }
    } // generateDaysOfTheWeekText
    
} // MacroProgressView



#Preview {
    MacroProgressView(weeklyProgress: [
        [0.2, 0.5, 0.8, 0.3, 0.0, 0.0, 0.0], // Weekly Calories
        [0.3, 0.6, 0.7, 0.2, 0.0, 0.0, 0.0], // Weekly Fats
        [0.4, 0.7, 0.5, 0.4, 0.0, 0.0, 0.0], // Weekly Carbs
        [0.1, 0.4, 0.6, 0.8, 0.0, 0.0, 0.0]  // Weekly Protein
    ])
}
