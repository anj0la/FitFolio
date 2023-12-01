//
//  ContentView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-11-30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var progress = 0.5

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(getTimeOfDay())
                    .font(.subheadline)
                Text(getDay())
                    .font(.title)
                Text("Nutrition Overview")
                    .font(.title2)
                // Total kcals, fats, carbs, and protein the user has accumulated in respect to their target for the day
                HStack {
                    Text("2000/2300").font(.caption2).padding(.leading, 12)
                    Text("10/50").font(.caption2).padding(.leading, 40)
                    Text("50/100").font(.caption2).padding(.leading, 52)
                    Text("25/75").font(.caption2).padding(.leading, 52)
                }.padding(.top, 2.5)
                // Progress bars for each macro and kcals
                HStack {
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: .black))
                        .padding().scaleEffect(1.25)
                    
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: .black))
                        .padding().scaleEffect(1.25)
                    
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: .black))
                        .padding().scaleEffect(1.25)
                    
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: .black))
                        .padding().scaleEffect(1.25)

                }.padding(.top, -15)
                Divider()
                
                Spacer()
            } // VStack
            Spacer()
        }.padding(.leading, 20) // HStack
        
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
    
} // ContentView

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
} // #Preview
