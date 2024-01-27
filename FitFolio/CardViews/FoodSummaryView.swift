//
//  FoodSummaryView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-29.
//

import SwiftUI

struct FoodSummaryView: View {
    let calories: String
    let fats: String
    let carbs: String
    let protein: String
    
    var body: some View {
        HStack {
            Text(calories)
            Image(systemName: "flame.fill").resizable()
                .frame(width: 10, height: 12).padding(.leading, -5)
            Text(fats).padding(.leading, 10)
            Text("F").font(.callout).bold().padding(.leading, -5)
            Text(carbs)
            Text("C").font(.callout).bold().padding(.leading, -5)
            Text(protein)
            Text("P").font(.callout).bold().padding(.leading, -5)
            Button(action: addNewFoodToList) {
                Image(systemName: "plus.app.fill")
                    .font(.body).foregroundStyle(.black)
            }.padding(.leading, 30)
        } // HStack
    } // body
    
    ///  Currently a placeholder function, but represents an action of the buttons on the cards with graphs.
    private func addNewFoodToList() -> Void {
        print("The button was clicked.")
    }
    
    
} // FoodSummaryView

#Preview {
    FoodSummaryView(calories: "200", fats: "10", carbs: "40", protein: "20")
}
