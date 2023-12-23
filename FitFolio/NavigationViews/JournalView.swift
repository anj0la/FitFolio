//
//  JournalView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-09.
//

import SwiftUI

struct JournalView: View {
    @Binding var selectedText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                generateHeader()
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
            Text("TODAY")
                .font(.title3).padding(.top, 0.01)
            Button(action: placeholder) {
                Image(systemName: "chevron.right")
                    .font(.callout).foregroundStyle(.black)
            }
        }.frame(maxWidth: 358, alignment: .center) // temp fix
    } // generateHeader
    
    private func generateOverviewCircles() -> some View {
        HStack {
            Button(action: placeholder) {
                Image(systemName: "chevron.left")
                    .font(.callout).foregroundStyle(.black)
            }
            Text("TODAY")
                .font(.title3).padding(.top, 0.01)
            Button(action: placeholder) {
                Image(systemName: "chevron.right")
                    .font(.callout).foregroundStyle(.black)
            }
        }
    } // generateOverviewCircles
    
    ///  Currently a placeholder function, but represents an action of the buttons on the cards with graphs.
    private func placeholder() -> Void {
        print("The button was clicked.")
    }
}

#Preview {
    JournalView(selectedText: .constant("Preview Text"))
}
