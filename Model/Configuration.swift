//
//  Config.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

/**
 Model contains all configuration data
 */
public struct Configuration: Decodable {
    
    // MARK: - properties
    
    public let owmAPIKey: String
    public let baseURL: String
}
