//
//  UserDefaults+Extensions.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 28/01/2022.
//

import Foundation

extension UserDefaults{
    
    private enum UserDefaultsKeys: String{
        case hasOnboarded
        
        
    }
    
    var hasOnboarded: Bool{
        get{
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        
        set{
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
    
}
