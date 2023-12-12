//
//  DashboardView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-09.
//

import SwiftUI

struct DashboardView: View {
    @State private var progress = 0.5 // will be taken from database, having separate progress bars for each day of the week
    @Binding var selectedText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                generateHeader()
                // Total kcals, fats, carbs, and protein the user has accumulated in respect to their target for the day
                generateDailyTargetText()
                generateDailyTargetProgressBars()
                Divider()
                
                // Rows
                ForEach(0..<4) { row in
                    generateProgressBarRows()
                }
                generateDaysOfTheWeekText()
                generateInsights()
                generateGoals()
                Spacer()
            } // VStack
            Spacer()
        }.padding(.leading, 20).onAppear {selectedText = "Dashboard"} // HStack
        
        
        
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
            Text(getTimeOfDay())
                .font(.subheadline)
            Text(getDay())
                .font(.title)
            Text("Nutrition Overview")
                .font(.title3).padding(.top, 0.01)
        }
    } // generateHeader
    
    /// Returns an HStack of the daily targets of calories, fat, carbs and protein.
    ///
    /// - Returns: HStack containing information about the daily target text.
    private func generateDailyTargetText() -> some View {
        HStack {
            Text("2000/2300").font(.caption2).padding(.leading, 12)
            Text("10/50").font(.caption2).padding(.leading, 40)
            Text("50/100").font(.caption2).padding(.leading, 52)
            Text("25/75").font(.caption2).padding(.leading, 52)
        }.padding(.top, 2.5)
    } // generateDailyTargetText
    
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
    
    private func generateInsights() -> some View {
        VStack (alignment: .leading) {
            Text("Insights").font(.title3).padding(.top, 0.1)
            Grid() {
                GridRow {
                    Text("WEIGHT").padding()
                        .background(Rectangle().stroke())
                    Text("TDEE").padding()
                        .background(Rectangle().stroke())
                }
                GridRow {
                    Text("STEPS").padding()
                        .background(Rectangle().stroke())
                    Text("WATER").padding()
                        .background(Rectangle().stroke())
                    }
                }
        }
    } // generateInsights
    
    private func generateGoals() -> some View {
        VStack (alignment: .leading) {
            Text("Goals").font(.title3).padding(.top, 0.1)
            Grid() {
                GridRow {
                    Text("FIBER").padding()
                        .background(Rectangle().stroke())
                    Text("SUGAR").padding()
                        .background(Rectangle().stroke())
                }
                GridRow {
                    Text("SODIUM").padding()
                        .background(Rectangle().stroke())
                    Text("IRON").padding()
                        .background(Rectangle().stroke())
                    }
                GridRow {
                    Text("MAGNESIUM").padding()
                        .background(Rectangle().stroke())
                    Text("VITAMIN C").padding()
                        .background(Rectangle().stroke())
                    }
                GridRow {
                    Text("CALCIUM").padding()
                        .background(Rectangle().stroke())
                    Text("VITAMIN D").padding()
                        .background(Rectangle().stroke())
                }
            }
        }
    } // generateGoals
    
    private func generateGraph() -> some View {
        HStack {
            VStack {
                Text("WEIGHT")
                
            }
        }
    } // generateGraph
    
} // ContentView

#Preview {
    DashboardView(selectedText: .constant("Preview Text"))
}
