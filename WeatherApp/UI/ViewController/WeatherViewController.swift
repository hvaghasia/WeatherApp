//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet private weak var forecastTableView: UITableView!
    @IBOutlet private weak var weatherView: WeatherHeaderView!

    // MARK: - Stored properties
    
    var viewModel: WeatherViewModel?
}

// MARK: - View life cycle

extension WeatherViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

// MARK: - Private methods

extension WeatherViewController {
    private func setup() {
        setupView()
        addObservers()
    }
    
    private func setupView() {
        title = "weather.screen.title".localized
        
        setupTableView()
    }
    
    private func setupTableView() {
        forecastTableView.tableFooterView = UIView()
    }
    
    private func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.weatherView.viewModel = self?.viewModel?.weatherHeaderViewModel
            self?.forecastTableView?.reloadData()
        }
    }
    
    /**
     Add observer to listen changes in `Weather` model in order to update changes on UI
     */
    private func addObservers() {
        viewModel?.interactor.weatherDidChange.add { [weak self] in
            self?.updateUI()
        }
    }
}

// MARK: - UITableViewDataSource

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ForecastTableViewCell.self)
        cell.viewModel = viewModel?.forecastCellViewModel(forIndex: indexPath.row)
        return cell
    }
}
