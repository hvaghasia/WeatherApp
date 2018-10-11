//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    // MARK: - UI Elements
    
    @IBOutlet private weak var minimumTemperatureLabel: UILabel!
    @IBOutlet private weak var maximumTemperatureLabel: UILabel!

    var viewModel: ForecastCellViewModel? {
        didSet {
            parseViewModel()
        }
    }
}

// MARK: - Private

extension ForecastTableViewCell {
    private func parseViewModel() {
        guard let viewModel = viewModel else { return }
        minimumTemperatureLabel.text = viewModel.minimumTemperature
        maximumTemperatureLabel.text = viewModel.maximumTemperature
    }
}
