//
//  FoodCardView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-29.
//

import SwiftUI




/**
 
 We need the food name, the serving size, the calories, the fats, carbs and protein only to display the food in a journal entry into a food card view.
 
 For the actual calculations, we'll get all of the nutrients (including micronutrients such as sugar, fiber and so forth, but it will be stored in the database)
 
 Remember that this struct is just to DISPLAY the food entered by the user (or from a predetermined selection).
 */

struct FoodCardView: View {
    let foodName: String
    let servingSize: MeasurementType
    let calories: String
    let fats: String
    let carbs: String
    let protein: String
    
    var body: some View {
        ZStack (alignment: .center) {

            Rectangle().stroke(
                Color.black,
                style: StrokeStyle(
                    lineWidth: 2,
                    lineCap: .round
                )
            ).frame(width: 300, height: 75)
            
            Image(systemName: "xmark.square").resizable().frame(width: 64, height: 64).padding(.leading, -144)
            
            VStack {
                HStack (spacing: 80.0) {
                    Text(foodName.uppercased()).font(.title3).bold()
                    
                    HStack {
                        Text(calories.uppercased() + " ").font(.title3).bold()
                        Image(systemName: "flame.fill").resizable()
                            .frame(width: 13, height: 17).padding(.leading, -10)
                    } // Food Name + Calories
                    
                }.padding(.leading, 64).padding(.top, 4)
                HStack {
                    HStack (spacing: 36.0) {
                        Text(servingSize.toString()).bold().opacity(0.5).font(.footnote)
                        Text(fats + "F " + carbs + "C " + protein + "P").bold().font(.footnote)
                    } // Serving size + Macronutrients
                }.padding(.leading, 68)
            } // VStack
            
            
        } // ZStack (Card)
    } // body
    
    private func createFoodCardBackground() -> some View {
        Rectangle().stroke(
            Color.black,
            style: StrokeStyle(
                lineWidth: 2,
                lineCap: .round
            )
        ).frame(width: 300, height: 75)
    } // createCardBackground
    
    private func createFoodCardHeader() -> some View {
        Image(systemName: "xmark.square").resizable().frame(width: 64, height: 64).padding(.leading, -144)
    }
    
    private func createFoodCardBody() -> some View {
        Image(systemName: "xmark.square").resizable().frame(width: 64, height: 64).padding(.leading, -144)
    }
    
    private func createFoodCardImage() -> some View {
        Image(systemName: "xmark.square").resizable().frame(width: 64, height: 64).padding(.leading, -144)
    }
    
} // FoodCardView


#Preview {
    FoodCardView(foodName: "Banana", servingSize: MeasurementType(value: 500, isMetric: true, unitName: "milimeteres"), calories: "400", fats: "10", carbs: "25", protein: "17")
}
