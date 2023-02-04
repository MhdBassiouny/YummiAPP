//
//  AppError.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 1/7/23.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidURL
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "I have no idea!!!"
        case .invalidURL:
            return "Add valid URL"
        case .serverError(let error):
            return error
        }
    }
}
