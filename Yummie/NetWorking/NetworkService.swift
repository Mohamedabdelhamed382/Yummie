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
    
    func myFirstRequest(){
        request(route: .fetchAllCategories, method: .get, type: String.self) { _ in }
    }
    
    private func request<T:Codable>(route: Route,
                                    method:Method,
                                    parameters: [String:Any]? = nil,
                                    type: T.Type,
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
                print("The response is : \(responseString)")
            }else if let error = error {
                result = .failure(error)
                print("The error is : \(error.localizedDescription)")
            }
            DispatchQueue.main.sync {
                
            }
        }.resume()
    }
    
    /// The function help us to generate a urlRequest
    /// - Parameters:
    ///   - route: the path resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: URLRequest
     func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest?{
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else {return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/jeson", forHTTPHeaderField: "content-Type")
        urlRequest.httpMethod = method.rawValue
        if let params = parameters{
            switch method{
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map{
                    URLQueryItem(name: $0, value: "\($1)")}
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch :
                let bodyData = try?
                    JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
