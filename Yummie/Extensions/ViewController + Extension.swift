//
//  UIViewController+Extension.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 16/01/2022.
//

import Foundation
import UIKit

extension UIViewController{
    
    static var identifier: String{
        
        return String(describing: self)
    }
    
    static func instantiate() -> Self{
        
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier)as! Self
    }
}
