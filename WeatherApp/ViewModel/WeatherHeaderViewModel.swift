//
//  WeatherHeaderViewModel.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Model

/**
 ViewModel to provide formated information to be displayed on Weather Header View
 */
struct WeatherHeaderViewModel {
    
    // MARK: - Properties
    
    private(set) var cityName: String = ""
    private(set) var iconText: String = ""
    private(set) var temperature: String = ""
    
    // MARK: - Initialization
    
    init(weatherData: WeatherHeaderViewData) {
        parseModel(weatherData: weatherData)
    }
}

// MARK: - Private

extension WeatherHeaderViewModel {
    mutating private func parseModel(weatherData: WeatherHeaderViewData) {
        cityName = weatherData.location
        iconText = weatherData.iconText
        temperature = weatherData.temperature
    }
}
