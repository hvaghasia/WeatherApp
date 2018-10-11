//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Model
import Common

/**
 ViewModel to back all needs for Weather View controller
 */
final class WeatherViewModel: NSObject {
    
    // MARK: - Properties
    
    let interactor: WeatherInteractor
    private let coordinator: WeatherCoordinator
    private var weather: Weather? {
        return interactor.weather
    }
    
    // MARK: - Initialization
    
    init(interactor: WeatherInteractor, coordinator: WeatherCoordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
        
        super.init()
        
        fetchWeatherData()
    }
}

// MARK: - DataSource methods for Weather header and table view

extension WeatherViewModel {
    
    var weatherHeaderViewModel: WeatherHeaderViewModel? {
        guard let weatherData = weatherHeaderViewData else { return nil }
        return WeatherHeaderViewModel(weatherData: weatherData)
    }
    
    var numberOfRows: Int {
        return weather?.forecasts.count ?? 0
    }
    
    func forecastCellViewModel(forIndex index: Int) -> ForecastCellViewModel? {
        guard let weatherModel = weather else { return nil }
        let forecastData = weatherModel.forecasts[index]
        let temperatureData = (forecastData.maxTemperature, forecastData.maxTemperature)
        return ForecastCellViewModel(temperatureData: temperatureData)
    }
}

// MARK: - Private

extension WeatherViewModel {
    private func fetchWeatherData() {
        interactor.fetchWeatherData()
    }
    
    private var weatherHeaderViewData: WeatherHeaderViewData? {
        guard let weatherModel = weather,
            let currentForecast = weatherModel.forecasts.first,
            let serverWeatherIcon = currentForecast.weatherIconData.first else { return nil }

        let weatherIcon = WeatherIcon(condition: serverWeatherIcon.id, iconString: serverWeatherIcon.icon)
        let localizedTemperatureValue = TempratureFormatter().localizedTemperatureString(tempValue: currentForecast.temperature)
        return WeatherHeaderViewData(location: weatherModel.city,
                                     iconText: weatherIcon.iconText,
                                     temperature: localizedTemperatureValue)
    }
}
