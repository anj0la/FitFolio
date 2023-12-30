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
            createFoodCardBackground()
            createFoodCardImage()
            VStack {
                createFoodCardButton()
                createFoodCardHeader()
                createFoodCardBody()
            } // VStack
        } // ZStack (Card)
    } // body
    
    // Private functions
    
    ///  Currently a placeholder function, but represents an action of the buttons on the cards with graphs.
    private func placeholder() -> Void {
        print("The button was clicked.")
    }
    
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
        HStack (spacing: 80.0) {
            Text(foodName.uppercased()).font(.title3).bold()
            HStack {
                Text(calories.uppercased() + " ").font(.title3).bold()
                Image(systemName: "flame.fill").resizable()
                    .frame(width: 13, height: 17).padding(.leading, -10)
            } // Food Name + Calories
        }.padding(.leading, 64)
    } // createFoodCardHeader
    
    private func createFoodCardBody() -> some View {
        HStack {
            HStack (spacing: 36.0) {
                Text(servingSize.toString()).bold().opacity(0.5).font(.footnote)
                Text(fats + "F " + carbs + "C " + protein + "P").bold().font(.footnote)
            } // Serving size + Macronutrients
        }.padding(.leading, 68).padding(.bottom, 10)
    } // createFoodCardBody
    
    private func createFoodCardImage() -> some View {
        Image(systemName: "xmark.square").resizable().frame(width: 64, height: 64).padding(.leading, -144)
    } // createFoodCardImage
    
    private func createFoodCardButton() -> some View {
        Button(action: placeholder) {
            Image(systemName: "ellipsis")
                .font(.body)
        }.padding(.leading, 272).padding(.bottom, -2.5)
    } //createFoodCardButton
    
} // FoodCardView


#Preview {
    FoodCardView(foodName: "Banana", servingSize: MeasurementType(value: 500, isMetric: true, unitName: "milimeteres"), calories: "400", fats: "10", carbs: "25", protein: "17")
}
