//
//  RootCoordinator.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Model
import Perform

/**
 RootCoordinator responsible for navigating to RootViewController(e.g Weather details view controller)
 It also prepares required dependency and pass over with ViewModel
 */
final class RootCoordinator {
    
    // MARK: - Properties(DI)
    
    private weak var viewController: UIViewController?
    
    // MARK: - Initialization
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    // MARK: - Navigation methods
    
    func displayWeatherInformationView() {
        
        let coordinator = WeatherCoordinator(viewController: viewController)
        let interactor = WeatherInteractor(dataManager: DataManager(dataSource: WeatherFetchService()))
        let weatherViewModel = WeatherViewModel(interactor: interactor, coordinator: coordinator)
        
        // Using perform, we perform storyboard segue for given identifier and
        // get access to destination viewcontroller in block which allows to pass over all required dependencies
        viewController?.perform(.showWeatherData) { weatherViewController in
            weatherViewController.viewModel = weatherViewModel
            weatherViewController.navigationController?.beatifyNavigationBar()
        }
    }
}
