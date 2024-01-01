////
////  FoodList.swift
////  FitFolio
////
////  Created by Anjola Aina on 2024-01-01.
////
//
//import Foundation
//
//class FoodList: ObservableObject {
//    @Published var foods: [Food] = []
//
//    // Additional methods to modify the list, if needed
//    func addFood(_ food: Food) {
//        foods.append(food)
//    } // addFood
//    
//    func insertFood(_ food: Food, at index: Int) {
//        guard index >= 0, index < foods.count else {
//            print("Invalid index. Entry not removed.")
//            return
//        }
//        foods.insert(food, at: index)
//    } // insertFood
//    
//    func updateFood(newFood: Food, at index: Int) {
//        guard index >= 0, index < foods.count else {
//            print("Invalid index. Entry not removed.")
//            return
//        }
//        foods[index] = newFood
//    } // updateFood
//    
//    func removeFood(at index: Int) -> Food {
//        guard index >= 0, index < foods.count else {
//            print("Invalid index. Entry not removed.")
//        }
//        foods.remove(at: index)
//    } // removeFood
//    
//    func removeAllFoods() {
//        foods.removeAll()
//    } // removeAllFoods
//    
//    
//    func removeLastFood() -> Food {
//        foods.removeLast()
//    } // removeLastFood
//
//} // FoodList
