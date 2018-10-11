//
//  WeatherHeaderView.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import UIKit


class WeatherHeaderView: UIView {

    // MARK: - UI Elements
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var weatherIconLabel: UILabel!
    @IBOutlet private weak var tempratureLabel: UILabel!

    var viewModel: WeatherHeaderViewModel? {
        didSet {
            parseViewModel()
        }
    }
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
}

// MARK: - Private

extension WeatherHeaderView {
    private func commonInit() {
        Bundle.main.loadNibNamed("WeatherHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func parseViewModel() {
        guard let viewModel = viewModel else { return }
        cityNameLabel.text = viewModel.cityName
        weatherIconLabel.text = viewModel.iconText
        tempratureLabel.text = viewModel.temperature
    }
}
