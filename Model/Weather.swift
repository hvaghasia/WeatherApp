//
//  Weather.swift
//  Model
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

public struct Weather {
    
    // MARK: - Stored properties
    
    public let city: String
    public let forecasts: [Forecast]
}

// MARK: - Decodable

extension Weather: Decodable {
    
    // MARK: - CodingKeys
    
    /**
     Coding keys for each key in json payload
     */
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case name = "name"
        case list = "list"
    }
    
    // MARK: - Initialization
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let cityContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .city)
        city = try cityContainer.decode(String.self, forKey: .name)
        
        forecasts = try container.decode([Forecast].self, forKey: .list)
    }
}
