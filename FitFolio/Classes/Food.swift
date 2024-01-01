//
//  MeasurementType.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-29.
//

import Foundation

class Food {
    //var id = UUID()
    var name: String
    var calories: Int
    var totalFats: Double
    var saturatedFat: Double
    var transFat: Double
    var cholesterol: Double
    var sodium: Double
    var totalCarbs: Double
    var fiber: Double
    var sugar: Double
    var protein: Double
    var calcium: Double
    var iron: Double
    var magnesium: Double
    var potassium: Double
    var zinc: Double
    var vitaminA: Double
    var vitaminC: Double
    var vitaminD: Double

    init(name: String,
         calories: Int,
         totalFats: Double,
         saturatedFat: Double,
         transFat: Double,
         cholesterol: Double,
         sodium: Double,
         totalCarbs: Double,
         fiber: Double,
         sugar: Double,
         protein: Double,
         calcium: Double,
         iron: Double,
         magnesium: Double,
         potassium: Double,
         zinc: Double,
         vitaminA: Double,
         vitaminC: Double,
         vitaminD: Double) {
            self.name = name
            self.calories = calories
            self.totalFats = totalFats
            self.saturatedFat = saturatedFat
            self.transFat = transFat
            self.cholesterol = cholesterol
            self.sodium = sodium
            self.totalCarbs = totalCarbs
            self.fiber = fiber
            self.sugar = sugar
            self.protein = protein
            self.calcium = calcium
            self.iron = iron
            self.magnesium = magnesium
            self.potassium = potassium
            self.zinc = zinc
            self.vitaminA = vitaminA
            self.vitaminC = vitaminC
            self.vitaminD = vitaminD
        }   // initalizer with all nutrient names as params
    
    convenience init(name: String,
                         calories: Int,
                         totalFats: Double,
                         saturatedFat: Double,
                         transFat: Double,
                         cholesterol: Double,
                         sodium: Double,
                         totalCarbs: Double,
                         fiber: Double,
                         sugar: Double,
                         protein: Double) {
            self.init(name: name,
                      calories: calories,
                      totalFats: totalFats,
                      saturatedFat: saturatedFat,
                      transFat: transFat,
                      cholesterol: cholesterol,
                      sodium: sodium,
                      totalCarbs: totalCarbs,
                      fiber: fiber,
                      sugar: sugar,
                      protein: protein,
                      calcium: 0.0,
                      iron: 0.0,
                      magnesium: 0.0,
                      potassium: 0.0,
                      zinc: 0.0,
                      vitaminA: 0.0,
                      vitaminC: 0.0,
                      vitaminD: 0.0)
                } // initializer with required nutrients on nutrition labels as params
    
    convenience init(name: String,
                         calories: Int,
                         totalFats: Double,
                         totalCarbs: Double,
                         protein: Double) {
            self.init(name: name,
                      calories: calories,
                      totalFats: totalFats,
                      saturatedFat: 0.0,
                      transFat: 0.0,
                      cholesterol: 0.0,
                      sodium: 0.0,
                      totalCarbs: totalCarbs,
                      fiber: 0.0,
                      sugar: 0.0,
                      protein: protein,
                      calcium: 0.0,
                      iron: 0.0,
                      magnesium: 0.0,
                      potassium: 0.0,
                      zinc: 0.0,
                      vitaminA: 0.0,
                      vitaminC: 0.0,
                      vitaminD: 0.0)
                } // initializer with only macronutrients as params
    
    convenience init() {
            self.init(name: "",
                      calories: 0,
                      totalFats: 0.0,
                      saturatedFat: 0.0,
                      transFat: 0.0,
                      cholesterol: 0.0,
                      sodium: 0.0,
                      totalCarbs: 0.0,
                      fiber: 0.0,
                      sugar: 0.0,
                      protein: 0.0,
                      calcium: 0.0,
                      iron: 0.0,
                      magnesium: 0.0,
                      potassium: 0.0,
                      zinc: 0.0,
                      vitaminA: 0.0,
                      vitaminC: 0.0,
                      vitaminD: 0.0)
                } // default initializer with all values set to zero
    
    
    var description: String {
        return """
        name: \(name),
        calories: \(calories),
        totalFats: \(totalFats),
        saturatedFat: \(saturatedFat),
        transFat: \(transFat),
        cholesterol: \(cholesterol),
        sodium: \(sodium),
        totalCarbs: \(totalCarbs),
        fiber: \(fiber),
        sugar: \(sugar),
        protein: \(protein),
        calcium: \(calcium),
        iron: \(iron),
        magnesium: \(magnesium),
        potassium: \(potassium),
        zinc: \(zinc),
        vitaminA: \(vitaminA),
        vitaminC: \(vitaminC),
        vitaminD: \(vitaminD)
        """
    } // the string representation of an instance of the Food class
    
} // Food
