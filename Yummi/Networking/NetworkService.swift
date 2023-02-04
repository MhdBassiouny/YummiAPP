//
//  NetworkService.swift
//  Yummi
//
//  Created by Muhammad Bassiouny on 1/7/23.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    
    func fetchAllCategories(completion: @escaping ((Result<AllDishes, Error>) -> Void)) {
        request(route: .fetchAllCategories, completion: completion)
    }
    
    
    func placeOrder(dishId: String, name: String, completion: @escaping (Result<Order, Error>) -> Void) {
        let params = ["name": name]
        request(route: .placeOrder(dishId), parameters: params, completion: completion)
    }
    
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping (Result<[Dish], Error>) -> Void) {
        request(route: .fetchCategortDish(categoryId), completion: completion)
    }
    
    
    func fetchOrders(completion: @escaping (Result<[Order], Error>) -> Void) {
        request(route: .fetchOrders, completion: completion)
    }
    
    
    
    private func request<T: Codable>(route: Route,
                                     parameters: [String: Any]? = nil,
                                     completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, parameters: parameters) else {
             completion(.failure(AppError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
            } else if let error = error {
                result = .failure(error)
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    
    private func handleResponse<T: Codable>(result: Result<Data, Error>?,
                                              completion: (Result<T, Error>) -> Void){
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch result {
        case .success(let data):
            guard let decodedData = try? JSONDecoder().decode(APIResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = decodedData.error {
                completion(.failure(AppError.serverError(error)))
            }
            
            if let decodedData = decodedData.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.unknownError))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    private func createRequest(route: Route,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseURL + route.description
        guard let url = urlString.asURL else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = route.method
        
        if let params = parameters {
            switch route.method {
            case "GET":
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
            case "POST":
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            default:
                break
            }
        }
        
        return urlRequest
    }
}
