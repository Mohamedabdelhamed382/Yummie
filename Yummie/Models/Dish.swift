//
//  Dish.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 15/01/2022.
//

import Foundation

struct Dish: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories:String{
        return ( "\(calories ?? 0) Calories")
    }
}
