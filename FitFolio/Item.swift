//
//  Item.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-11-30.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
