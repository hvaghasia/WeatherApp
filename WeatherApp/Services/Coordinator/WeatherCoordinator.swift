//
//  WeatherCoordinator.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Model

protocol WeatherCoordinatorProtocol: class {
    func showdetails(for weather: Weather)
    func dismissWeather()
}

/**
 WeatherCoordinator responsible for displaying Weather details view-controller
 It also prepares required dependency and pass over with ViewModel
 */
final class WeatherCoordinator: WeatherCoordinatorProtocol {
    
    // MARK: - Properties(DI)
    
    private weak var viewController: UIViewController?
    
    // MARK: - Initialization
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation methods
    
    func showdetails(for weather: Weather) {
        // show for details for given city's weather
    }
    
    func dismissWeather() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
