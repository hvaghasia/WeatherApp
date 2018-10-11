//
//  InitialViewController.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import UIKit

final class InitialViewController: UIViewController { }

// MARK: - View life cycle

extension InitialViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayWeatherInfo()
    }
}

// MARK: - Private methods

extension InitialViewController {
    private func displayWeatherInfo() {
        DispatchQueue.main.async { [weak self] in
            let rootCoordinator = RootCoordinator(viewController: self)
            rootCoordinator.displayWeatherInformationView()
        }
    }
}
