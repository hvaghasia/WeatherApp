//
//  RequestError.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

public enum RequestError: Error, CustomStringConvertible {
    case apiError(error: [String: Any])
    case httpError(error: Error)
    case parserError
    case noError
    
    public var description: String {
        switch self {
        case .apiError(let apiError): return "Internal error: \(apiError)"
        case .httpError(let httpError): return "HTTP Error: \(httpError)"
        case .parserError: return "Parsing error"
        default: return ""
        }
    }
}
