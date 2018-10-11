//
//  WeatherFetchService.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Model
import Common
import CoreLocation

/**
 Service to fetch weather data from server
 */
final class WeatherFetchService: DataSource {
    typealias DataType = Weather
    
    /**
     fetch Weather data from Server
     - parameter completionHandler: Fetched data will be sent to subscriber using completion block
     */
    func fetchData(completionHandler: @escaping (DataType?, RequestError?) -> Void) {
        let location = CLLocation(latitude: Constants.LocationConstants.latitude, longitude: Constants.LocationConstants.longitude)
        WeatherAPIManager().fetchWeatherData(for: location, completionHandler: completionHandler)
    }
}
