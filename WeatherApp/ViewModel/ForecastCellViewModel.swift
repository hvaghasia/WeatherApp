//
//  ForecastCellViewModel.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Common

typealias ForecastTemperature = (minimumTemperature: Double, maximumTemperature: Double)

/**
 ViewModel to provide formated information to be displayed on Forecast tableview cell
 */
struct ForecastCellViewModel {
    
    // MARK: - Properties
    
    private(set) var minimumTemperature: String = ""
    private(set) var maximumTemperature: String = ""
    
    // MARK: - Initialization
    
    init(temperatureData: ForecastTemperature) {
        parseModel(temperatureData: temperatureData)
    }
}

// MARK: - Private

extension ForecastCellViewModel {
    mutating private func parseModel(temperatureData: ForecastTemperature) {
        minimumTemperature = TempratureFormatter().localizedTemperatureString(tempValue: temperatureData.minimumTemperature)
        maximumTemperature = TempratureFormatter().localizedTemperatureString(tempValue: temperatureData.maximumTemperature)
    }
}
