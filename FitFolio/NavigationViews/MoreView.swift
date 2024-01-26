//
//  MoreView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-09.
//

import SwiftUI

struct MoreView: View {
    @Binding var selectedText: String

    var body: some View {
        VStack {
            createUserHeader()
            createOptionsList()
            
        }.onAppear { selectedText = "More" }
        
        
        
    } // body
    
    private func createListItem(itemText: String, maxWidth: CGFloat) -> some View {
        HStack {
            Text(itemText)
            Button(action: placeholder) {
                Image(systemName: "arrow.right")
                    .font(.callout).foregroundStyle(.black)
            }.frame(maxWidth: maxWidth, alignment: .trailing)
        }
    } // createListItem
    
    private func createUserHeader() -> some View {
        VStack(spacing: 15.0) {
            CircularImageWithOutlineView(chosenImage: "person.fill", frameWidth: 75, frameHeight: 75, paddingSize: 30, lineWidth: 7.5)
            Text("2 day streak").font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            Text("40 lbs lost").font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
        }
    } // createUserHeader
    
    private func createOptionsList() -> some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Goals", maxWidth: 315)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Progress", maxWidth: 292)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Nutrition", maxWidth: 295)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Weekly Highlights", maxWidth: 225)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Reminders", maxWidth: 280)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Meals, Recipes & Foods", maxWidth: 180)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Intermittent Fasting", maxWidth: 215)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Programs", maxWidth: 290)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Steps", maxWidth: 320)
            Divider().padding(.trailing, 12)
            createListItem(itemText: "Settings", maxWidth: 300)
        }
        .padding(.leading, 12.0)
    } // createOptionsList
    
    ///  Currently a placeholder function, but represents an action of the buttons on the cards with graphs.
    private func placeholder() -> Void {
        print("The button was clicked.")
    }
    
} // MoreView

#Preview {
    MoreView(selectedText: .constant("Preview Text"))
}
