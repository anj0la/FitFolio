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
            Text("200")
            Image(systemName: "flame.fill").resizable()
                .frame(width: 10, height: 12).padding(.leading, -5)
            Text("20").padding(.leading, 10)
            Text("F").font(.callout).bold().padding(.leading, -5)
            Text("40")
            Text("C").font(.callout).bold().padding(.leading, -5)
            Text("30")
            Text("P").font(.callout).bold().padding(.leading, -5)
            Button(action: placeholder) {
                Image(systemName: "plus.app.fill")
                    .font(.body).foregroundStyle(.black)
            }.padding(.leading, 45)
        }
    }
}

#Preview {
    FoodSummaryView()
}
