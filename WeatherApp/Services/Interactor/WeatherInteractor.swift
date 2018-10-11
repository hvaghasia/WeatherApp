//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Model
import Common

protocol WeatherInteractorProtocol {
    var weather: Weather? { get }
    var weatherDidChange: ObserverSet<Void> { get }
    
    func fetchWeatherData()
}

/**
 WeatherInteractor responsible for providing required data to be displayed on Weather view
 */
final class WeatherInteractor: WeatherInteractorProtocol {
    
    // MARK: - Properties
    
    // Observable property. Any changes in weather will be communicated to ViewController to update UI
    private(set) var weather: Weather? {
        didSet {
            weatherDidChange.notify(())
        }
    }
    var weatherDidChange = ObserverSet<Void>()
    private let dataManager: DataManager<WeatherFetchService>
    
    // MARK: - Initialization
    
    init(dataManager: DataManager<WeatherFetchService>) {
        self.dataManager = dataManager
    }
    
    // MARK: - Fetch Models
    
    func fetchWeatherData() {
        dataManager.fetchData() { [weak self] (weather, error) in
            self?.weather = weather
        }
    }
}
