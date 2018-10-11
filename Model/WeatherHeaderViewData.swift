//
//  WeatherHeaderViewData.swift
//  Model
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

public struct WeatherHeaderViewData {
    
    // MARK: - properties
    
    public let location: String
    public let iconText: String
    public let temperature: String
    
    // MARK: - Initialization
    
    public init(location: String, iconText: String, temperature: String) {
        self.location = location
        self.iconText = iconText
        self.temperature = temperature
    }
}
