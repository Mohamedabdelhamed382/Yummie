//
//  UIView.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 12/01/2022.
//

import Foundation
import UIKit

extension UIView{
    
    @IBInspectable var cornerRedius:CGFloat{
        get{ return self.cornerRedius}
        set{ self.layer.cornerRadius = newValue}
    }
    
    
}
