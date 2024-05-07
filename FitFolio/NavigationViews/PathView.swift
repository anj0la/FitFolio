//
//  PathView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-09.
//

import SwiftUI

struct PathView: View {
    @State private var progress = 0.5 // will be taken from database, having separate progress bars for each day of the week
    @Binding var selectedText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                generateHeader()
                // Total kcals, fats, carbs, and protein the user has accumulated in respect to their target for the day
                generateDailyAndWeeklyMetrics()
                Divider()
                
                // Custom Macro Progress View
                MacroProgressView(weeklyProgress: [
                    [0.2, 0.5, 0.8, 0.3, 0.0, 0.0, 0.0], // Weekly Calories
                    [0.3, 0.6, 0.7, 0.2, 0.0, 0.0, 0.0], // Weekly Fats
                    [0.4, 0.7, 0.5, 0.4, 0.0, 0.0, 0.0], // Weekly Carbs
                    [0.1, 0.4, 0.6, 0.8, 0.0, 0.0, 0.0]  // Weekly Protein
                ])
                Spacer()
            } // VStack
            Spacer()
        }.padding(.leading, 20).onAppear {selectedText = "Path"} // HStack
    } // body
    
    /// Returns the string value of the current time of day.
    ///
    /// - Returns: The string value of the current time of day (i.e., morning, afternoon or evening).
    private func getTimeOfDay() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        switch hour {
        case 0..<12:
            return "Good morning"
        case 12..<17:
            return "Good afternoon"
        default:
            return "Good evening!"
        } // switch
    } // getTimeOfDay
    
    /// Returns the current day of the week as a string.
    ///
    /// - Returns: The current date of the week as a string.
    private func getDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d"
        return dateFormatter.string(from: Date())
    } // getDay
    
    /// Returns a VStack containing the time of day and the current day.
    ///
    /// - Returns: VStack containing information about the current day.
    private func generateHeader() -> some View {
        VStack(alignment: .leading) {
            Text("Lose 1 lb(s) per week")
                .font(.subheadline)
            Text("Balanced Program")
                .font(.title)
                .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
            Text("Daily & Weekly Metrics")
                .font(.headline).fontWeight(.regular).padding(.top, 0.01)
        }
    } // generateHeader
    
    /// Returns an HStack of the daily targets of calories, fat, carbs and protein.
    ///
    /// - Returns: HStack containing information about the daily target text.
    private func generateDailyAndWeeklyMetrics() -> some View {
        HStack {
            Text("2000").font(.title3)
            Image(systemName: "flame.fill").resizable()
                .frame(width: 10, height: 12).padding(.leading, -4)
            Text("/ day").padding(.leading, -4)
            Text("9500").font(.title3)
            Image(systemName: "flame.fill").resizable()
                .frame(width: 10, height: 12).padding(.leading, -4)
            Text("/ week").padding(.leading, -4)
            Text("2000").font(.title3)
            Image(systemName: "flame.fill").resizable()
                .frame(width: 10, height: 12).padding(.leading, -4)
            Text(" on avg").padding(.leading, -4)
        }.padding(.top, 2.5)
    } // generateDailyTargetText
    
    /// Returns an HStack of the progress bars of the daily targets of calories, fat, carbs and protein.
    ///
    /// - Returns: HStack containing information about the daily target progress bars..
    private func generateDailyTargetProgressBars() -> some View {
        HStack {
            ForEach(0..<4) { _ in
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .black))
                    .padding()
                    .scaleEffect(1.25)
            }
        }.padding(.top, -15)
    } // generateDailyTargetProgressBars
     
    /// Returns an HStack of the progress bars of one of the days in a week, highlight the total number of calories, fat, carbs and protein for that day.
    ///  MAKE INTO SPECIAL VIEW
    ///
    /// - Returns: HStack containing information about a day's targets.
    private func generateProgressBarRows() -> some View {
        HStack {
            ForEach(0..<7) { _ in
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .black))
                    .padding()
                    .scaleEffect(1.5)
                    .rotationEffect(.degrees(90))
                }
            }
    } // generateProgressBarRows
    
    /// Returns an HStack displaying the days of the week.
    ///
    /// - Returns: HStack displaying each day of the week as text.
    private func generateDaysOfTheWeekText() -> some View {
        HStack {
            Text("Mo").font(.caption).bold().padding(.leading, 15)
            Text("Tu").font(.caption).bold().padding(.leading, 25)
            Text("We").font(.caption).bold().padding(.leading, 30)
            Text("Th").font(.caption).bold().padding(.leading, 30)
            Text("Fr").font(.caption).bold().padding(.leading, 30)
            Text("Sa").font(.caption).bold().padding(.leading, 30)
            Text("Su").font(.caption).bold().padding(.leading, 30)
        }
    } // generateDaysOfTheWeekText
} // PathView


#Preview {
    PathView(selectedText: .constant("Preview Text"))
}
