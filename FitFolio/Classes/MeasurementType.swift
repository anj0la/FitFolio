//
//  MeasurementType.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-29.
//

import Foundation

class Food {
    var name: String
    var calories: Double
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
         calories: Double,
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
        }   // constructor with all nutrient names as parameters
    
    
    var description: String {
            return "Property1: \(property1), Property2: \(property2)"
        }
} // MeasurementType
