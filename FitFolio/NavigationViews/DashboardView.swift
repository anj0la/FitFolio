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
    
    /// Returns an VStack containing information on important insights, which are the user's weight, TDEE, steps and water intake..
    ///
    /// - Returns: VStack containing information about important insights of the user.
    private func generateInsights() -> some View {
        VStack (alignment: .leading) {
            Text("Insights").font(.title3).padding(.top, 0.1)
            Grid() {
                GridRow {
                    generateCardWithGraph(cardHeaderName: "WEIGHT", cardFooterName: "140 lbs")
                    generateCardWithGraph(cardHeaderName: "TDEE", cardFooterName: "2000 cal")
                }
                GridRow {
                    generateCardWithGraph(cardHeaderName: "STEPS", cardFooterName: "7800 steps")
                    generateCardWithGraph(cardHeaderName: "WATER", cardFooterName: "49 oz")
                    }
                }
        }
    } // generateInsights
    
    /// Returns an VStack containing information on goals that the user has indentified. Not all of these goals will be displayed, and will be dependent on whether the user wants to track the goals or not.
    ///
    /// - Returns: VStack containing information about goals  of the user.
    private func generateGoals() -> some View {
        VStack (alignment: .leading) {
            Text("Goals").font(.title3).padding(.top, 0.1)
            Grid() {
                GridRow {
                    generateCardWithGraph(cardHeaderName: "FIBER", cardFooterName: "25 g")
                    generateCardWithGraph(cardHeaderName: "SUGAR", cardFooterName: "39 g")
                }
                GridRow {
                    generateCardWithGraph(cardHeaderName: "SODIUM", cardFooterName: "25 g")
                    generateCardWithGraph(cardHeaderName: "IRON", cardFooterName: "39 g")
                    }
                GridRow {
                    generateCardWithGraph(cardHeaderName: "MAGNESIUM", cardFooterName: "35 g")
                    generateCardWithGraph(cardHeaderName: "VITAMIN C", cardFooterName: "29 g")
                    }
                GridRow {
                    generateCardWithGraph(cardHeaderName: "CALCIUM", cardFooterName: "35 g")
                    generateCardWithGraph(cardHeaderName: "VITAMIN D", cardFooterName: "29 g")
                }
            }
        }
    } // generateGoals
    
    /// Returns an VStack that generates a card view with a graph.
    ///
    /// - Parameters:
    ///     - cardHeaderName: the value that the header of the card will be set to.
    ///     - cardFooterName: the value that the footer of the card will be set to.
    ///
    /// - Returns: VStack containing information about important insights of the user.
    private func generateCardWithGraph(cardHeaderName: String, cardFooterName: String) -> some View {
        VStack (alignment: .leading) {
            HStack {
                Text(cardHeaderName)
                Button(action: placeholder) {
                    Image(systemName: "plus")
                        .font(.body).foregroundStyle(.black)
                }.frame(maxWidth: 100, alignment: .trailing)
            } // top header
            HStack {
                ZStack {
                    Rectangle().stroke().frame(width: 140, height: 110)
                    Text("Placeholder for Graph")
                } // Temporary placeholder for graph
            } // the graph area
            HStack {
                Text(cardFooterName).font(.footnote)
                Button(action: placeholder) {
                    Image(systemName: "arrow.right")
                        .font(.callout).foregroundStyle(.black)
                }.frame(maxWidth: 125, alignment: .trailing)
            }.padding(.top, 1) // bottom header
            
        }.padding().border(.black)
    } // generateGraph
    
    ///  Currently a placeholder function, but represents an action of the buttons on the cards with graphs.
    private func placeholder() -> Void {
        print("The button was clicked.")
    }
    
} // ContentView

#Preview {
    DashboardView(selectedText: .constant("Preview Text"))
}
