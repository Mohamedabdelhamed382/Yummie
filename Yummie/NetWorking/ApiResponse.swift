//
//  ApiResponse.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 24/01/2022.
//

import Foundation

struct ApiResponse<T: Decodable>:Decodable {
    let status:Int
    let message: String?
    let data: T?
    let error: String?
}
