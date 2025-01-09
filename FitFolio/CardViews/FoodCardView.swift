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
    let foodItem: Food
    let servingSize: ServingSize

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
        ).frame(width: 250, height: 65)
    } // createCardBackground
    
    private func createFoodCardHeader() -> some View {
        HStack (spacing: 60.0) {
            Text(foodItem.name.uppercased()).font(.headline).bold()
            HStack {
                Text(String(foodItem.calories).uppercased() + " ").font(.headline).bold()
                Image(systemName: "flame.fill").resizable()
                    .frame(width: 13, height: 17).padding(.leading, -10)
            } // Food Name + Calories
        }.padding(.leading, 56)
    } // createFoodCardHeader
    
    private func createFoodCardBody() -> some View {
        HStack {
            HStack (spacing: 10.0) {
                Text(servingSize.toString()).bold().opacity(0.5).font(.caption)
                
                Text("\(Int(foodItem.totalFats))F \(Int(foodItem.totalCarbs))C \(Int(foodItem.protein))P")
                    .bold()
                    .font(.footnote)
            } // Serving size + Macronutrients
        }.padding(.leading, 60).padding(.bottom, 10)
    } // createFoodCardBody
    
    private func createFoodCardImage() -> some View {
        Image(systemName: "xmark.square").resizable().frame(width: 50, height: 50).padding(.leading, -118)
    } // createFoodCardImage
    
    private func createFoodCardButton() -> some View {
        Button(action: placeholder) {
            Image(systemName: "ellipsis")
                .font(.body).foregroundStyle(.black)
        }.padding(.leading, 222).padding(.bottom, -4.5)
    } //createFoodCardButton
    
} // FoodCardView


#Preview {
    FoodCardView(foodItem: Food(name: "Banana", calories: 400, totalFats: 10.0, totalCarbs: 25.0, protein: 17.0), servingSize: ServingSize(value: 500, isMetric: true, unitName: "milimeteres"))

}
