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
            Button(action: placeholder) {
                Image(systemName: "chevron.left")
                    .font(.callout).foregroundStyle(.black)
            }
            Text(selectedDay)
                .font(.title3).padding(.top, 0.01)
            Button(action: placeholder) {
                Image(systemName: "chevron.right")
                    .font(.callout).foregroundStyle(.black)
            }
        }.frame(maxWidth: 358, alignment: .center) // temp fix
    } // generateHeader
    
    private func generateOverviewCircles() -> some View {
        HStack {
            CircularProgressView(progress: 0.2, circleWidth: 7.5).padding(10)
            CircularProgressView(progress: 0.2, circleWidth: 7.5).padding(10)
            CircularProgressView(progress: 0.2, circleWidth: 7.5).padding(10)
            CircularProgressView(progress: 0.2, circleWidth: 7.5).padding(10)
        }.padding(.leading, -10)
    } // generateOverviewCircles
    
    ///  Currently a placeholder function, but represents an action of the buttons on the cards with graphs.
    private func placeholder() -> Void {
        print("The button was clicked.")
    }
    
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
