//
//  Segue.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Perform

extension Segue {
    static var showWeatherData: Segue<WeatherViewController> {
        return .init(identifier: SegueIdentifier.showWeatherData.rawValue)
    }
}

// MARK: - Segue Identifier enum options

enum SegueIdentifier: String {
    case showWeatherData
}
