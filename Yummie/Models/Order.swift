//
//  Order.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 17/01/2022.
//

import Foundation
import UIKit

struct Order:Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}

