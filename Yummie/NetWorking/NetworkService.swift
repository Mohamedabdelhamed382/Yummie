//
//  NetworkService.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 17/01/2022.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init(){}
    
    func fetchAllCategories(completion: @escaping (Result<AllDishes, Error>) -> Void){
        request(route: .fetchAllCategories, method: .get, complation: completion)
    }
    
    func placeOrder(dishId: String, name:String, completion: @escaping (Result<Order, Error>) -> Void){
        let params = ["name": name]
        request(route: .placeOrder(dishId), method: .post, parameters: params, complation: completion)
    }
    
    private func request<T:Decodable>(route: Route,
                                    method:Method,
                                    parameters: [String:Any]? = nil,
                                    complation: @escaping (Result<T,Error>) -> Void){
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            complation(.failure(AppError.unKnownError))
            return
        }
        URLSession.shared.dataTask(with: request){data, response, error in
            var  result: Result<Data, Error>?
            if let data = data{
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "could not stringifyour data"
            }else if let error = error {
                result = .failure(error)
                print("The error is : \(error.localizedDescription)")
            }
            DispatchQueue.main.sync {
                self.HandleResponse(result: result, complation: complation)
            }
        }.resume()
    }
    
    private func HandleResponse<T: Decodable>(result: Result<Data, Error>?, complation: @escaping (Result<T,Error>) -> Void){
        
        guard let result = result else {
            complation(.failure(AppError.unKnownError))
            return
        }
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try?
                decoder.decode(ApiResponse<T>.self, from: data) else {
                complation(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.error{
                complation(.failure(AppError.ServerError(error)))
            }
            
            if let decodedData = response.data{
                complation(.success(decodedData))
            }else{
                complation(.failure(AppError.errorDecoding))
            }
            
        case .failure(let error):
            complation(.failure(error))
        }
        
        
    }

    /// This function helps us to generate a urlRequest
       /// - Parameters:
       ///   - route: the path the the resource in the backend
       ///   - method: type of request to be made
       ///   - parameters: whatever extra information you need to pass to the backend
       /// - Returns: URLRequest
       private func createRequest(route: Route,
                                  method: Method,
                                  parameters: [String: Any]? = nil) -> URLRequest? {
           let urlString = Route.baseUrl + route.description
           guard let url = urlString.asUrl else { return nil }
           var urlRequest = URLRequest(url: url)
           urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
           urlRequest.httpMethod = method.rawValue
           if let params = parameters {
               switch method {
               case .get:
                   var urlComponent = URLComponents(string: urlString)
                   urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                   urlRequest.url = urlComponent?.url
               case .post, .delete, .patch:
                   let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                   urlRequest.httpBody = bodyData
               }
           }
           return urlRequest
       }
}
