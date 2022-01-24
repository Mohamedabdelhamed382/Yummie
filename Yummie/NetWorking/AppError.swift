//
//  AppError.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 23/01/2022.
//

import Foundation

enum AppError: LocalizedError{
    case  errorDecoding
    case unKnownError
    case invalidUrl
    case ServerError(String)
        
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Respones could not be decoded"
        case .unKnownError:
            return "I have no idea what go on"
        case .invalidUrl:
            return " Give Me valid URl"
        case .ServerError(let error):
            return error
        }
    }
    
    
}
