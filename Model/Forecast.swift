//
//  Forecast.swift
//  Model
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

public struct Forecast {
    
    // MARK: - properties
    
    public let dateTime: Double
    public let temperature: Double
    public let minTemperature: Double
    public let maxTemperature: Double
    public let weatherIconData: [WeatherIconServerData]
}

// MARK: - Decodable

extension Forecast: Decodable {
    
    // MARK: - CodingKeys
    
    /**
     Coding keys for each key in json payload
     */
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        
        case main = "main"
        case temp = "temp"
        case minTemprature = "temp_min"
        case maxTemprature = "temp_max"

        case weather = "weather"
        case weatherId = "id"
        case weatherIcon = "icon"
    }
    
    // MARK: - Initialization
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dateTime = try container.decode(Double.self, forKey: .date)
        
        let mainContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .main)
        temperature = try mainContainer.decode(Double.self, forKey: .temp)
        minTemperature = try mainContainer.decode(Double.self, forKey: .minTemprature)
        maxTemperature = try mainContainer.decode(Double.self, forKey: .maxTemprature)
        
        weatherIconData = try container.decode([WeatherIconServerData].self, forKey: .weather)
    }
}
