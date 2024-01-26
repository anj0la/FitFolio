//
//  JournalView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-09.
//

import SwiftUI

struct JournalView: View {
    @Binding var selectedText: String
    @State private var selectedDay = "TODAY" // default value is always TODAY (i.e., the current day)
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                generateHeader()
                generateOverviewCircles()
                generateProgressBars()
                Divider().padding(.bottom, 10)
                createJournal()
                Spacer()
            } // VStack
            Spacer()
        }.padding(.leading, 20).onAppear {selectedText = "Journal"} // HStack
    } // body
    
    /// Returns a VStack containing the time of day and the current day.
    ///
    /// - Returns: VStack containing information about the current day.
    private func generateHeader() -> some View {
        HStack {
            Button(action: showNextDay) {
                Image(systemName: "chevron.left")
                    .font(.callout).foregroundStyle(.black)
            }
            Text(selectedDay)
                .font(.title3).padding(.top, 0.01)
            Button(action: showNextDay) {
                Image(systemName: "chevron.right")
                    .font(.callout).foregroundStyle(.black)
            }
        }.frame(maxWidth: 358, alignment: .center) // temp fix
    } // generateHeader
    
    ///
    /// Returns an HStack containing all the circles that represent the current intake that a user has logged in for: calories, carbohydrates, fats and protein. Makes use of the custom circular progress view.
    ///
    /// - Returns: HStack containing information about current intake of calories, carbohydrates, fats and proteins for the selected day.
    ///
    ///
    private func generateOverviewCircles() -> some View {
        HStack {
            CircularProgressView(progress: 0.74, circleWidth: 7.5, intake: "1700", intakeTarget: "2300", intakeUnits: "cal", intakeColor: Color.green).padding(5)
            CircularProgressView(progress: 0.6, circleWidth: 7.5, intake: "30", intakeTarget: "50", intakeUnits: "g", intakeColor: Color.yellow).padding(5)
            CircularProgressView(progress: 0.66, circleWidth: 7.5, intake: "100", intakeTarget: "150", intakeUnits: "g", intakeColor: Color.cyan).padding(5)
            CircularProgressView(progress: 0.75, circleWidth: 7.5, intake: "75", intakeTarget: "100", intakeUnits: "g", intakeColor: Color.purple).padding(5)
        }.padding(.leading, -10)
    } // generateOverviewCircles
    
    private func generateProgressBars() -> some View {
        HStack {
            // Calories
            Image(systemName: "flame.fill").resizable()
                .frame(width: 10, height: 12).padding(.leading, -5)
            ProgressView(value: 0.74)
                .progressViewStyle(LinearProgressViewStyle(tint: .green))
                .padding(.horizontal, 10.0)
                .scaleEffect(1.35)
            // Fats
            Text("F").font(.caption).bold()
            ProgressView(value: 0.6)
                .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
                .padding(.horizontal, 10.0)
                .scaleEffect(1.35)
            // Carbs
            Text("C").font(.caption).bold()
            ProgressView(value: 0.66)
                .progressViewStyle(LinearProgressViewStyle(tint: .cyan))
                .padding(.horizontal, 10.0)
                .scaleEffect(1.35)
            // Protein
            Text("P").font(.caption).bold()
            ProgressView(value: 0.75)
                .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                .padding(.horizontal, 10.0)
                .scaleEffect(1.35)
        }.padding(.top, 2.5).padding(.leading, -10)
    } // generateProgressBars
    
    // This will be made into its own class (struct) tbh, called Journal, where there are timestamps, certain instances and functions such as creating timestamps, emptying a journal, adding a entry to the journal and so forth.
    // I might make another struct called JournalEntry which actually creates one entry in the journal, by getting the timestamp, and then the calories, fats, carbs, and protein from the food.
    private func createJournal() -> some View {
        HStack {
            Text("HI")
            //createTimesOfTheDay()
            //createJournalEntries()
        }
    } // createJournal
    
    /// Shows the next day.
    ///
    ///
    private func showNextDay() -> Void {
        // This function would actually show the next day.
        // For now, only the text would change, but basically
        // all of the EMPTY values would be displayed
        // and would be in "editing / planning" mode
    }
}

#Preview {
    JournalView(selectedText: .constant("Preview Text"))
}
