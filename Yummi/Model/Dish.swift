//
//  Dish.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 12/31/22.
//

import Foundation

struct Dish: Codable {
    let id, name, description, image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%.2f", calories ?? 0)
    }
}
