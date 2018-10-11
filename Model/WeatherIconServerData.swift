//
//  WeatherIconServerData.swift
//  Model
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

public struct WeatherIconServerData: Decodable {
    
    // MARK: - properties
    
    public let id: Int
    public let icon: String
}
