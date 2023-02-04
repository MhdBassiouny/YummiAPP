//
//  Route.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 1/7/23.
//

import Foundation

enum Route {
    static let baseURL = "https://yummie.glitch.me/"
    
    case fetchAllCategories
    case placeOrder(String)
    case fetchCategortDish(String)
    case fetchOrders
    
    var description: String {
        switch self {
        case .fetchAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategortDish(let categoryId):
            return "/dishes/\(categoryId)"
        case .fetchOrders:
            return "/orders"
        }
    }
    
    var method: String {
        switch self {
        case .fetchAllCategories, .fetchCategortDish, .fetchOrders:
            return "GET"
        case .placeOrder(_):
            return "POST"
        }
    }
}
