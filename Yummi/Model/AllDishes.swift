//
//  AllDishes.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 1/8/23.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
