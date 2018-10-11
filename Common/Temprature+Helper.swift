//
//  Temprature+Helper.swift
//  Common
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

/**
 To format given temprature value according to current locale
 */
public final class TempratureFormatter {
    
    public init() {}
    
    // Convert given Kelvin temperature value into C/F according to locale
    public func localizedTemperatureString(tempValue: Double) -> String {
        let measurement = Measurement(value: tempValue, unit: UnitTemperature.kelvin)
        let temperature = formatter.string(from: measurement)
        return temperature
    }
}

// MARK: - MeasurementFormatter

extension TempratureFormatter {
    private var formatter: MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.locale = Locale.current
        formatter.unitStyle = .medium
        
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .up
        formatter.numberFormatter = numberFormatter
        return formatter
    }
}
