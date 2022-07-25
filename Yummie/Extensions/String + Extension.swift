//
//  String+Extension.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 14/01/2022.
//

import Foundation
extension String{
    var asUrl: URL?{
        return URL(string: self)
    }
    
}
