//
//  APIResponse.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 1/7/23.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
