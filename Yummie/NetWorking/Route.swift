//
//  Route.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 17/01/2022.
//

import Foundation
 
enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    
    var description:String{
        switch self {
        case .fetchAllCategories:
            return "/dishes/cat1"
        }
    }
    
}
