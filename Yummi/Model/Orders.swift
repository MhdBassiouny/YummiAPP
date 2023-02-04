//
//  Orders.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 1/3/23.
//

import Foundation

struct Order: Codable {
    let id: String?
    let name: String?
    let dish: Dish
}
