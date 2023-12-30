//
//  MeasurementType.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-29.
//

import Foundation

class MeasurementType {
    var value: Double
    var isMetric: Bool
    var unitName: String
    
    init(value: Double, isMetric: Bool, unitName: String) {
        self.value = value
        self.isMetric = isMetric
        self.unitName = unitName
    }
    
    // TODO - UPDATE WHEN WE HAVE DATA
    
    func convertToMetric() -> Void {
        // Logic for converting to metric
    } // convertToMetric
    
    func convertToImperial() -> Void {
        if isMetric {
            // Logic for converting from metric to imperial
            switch unitName {
            case "milliliters":
                value /= 29.5735
                unitName = "fluid ounces"
            case "grams":
                value /= 28.3495
                unitName = "ounces"
            default:
                break
            }
            isMetric = false
        }
    } // convertToImperial
    
    func toString() -> String {
        return String(format: "%.0f", value) + " " + unitName
    }
} // MeasurementType
