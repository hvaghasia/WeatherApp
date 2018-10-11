//
//  DataManager.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

/**
 DataManager deal with diff type of Service which confirms to DataSource protocol
 */
struct DataManager<DataSourceType: DataSource> {
    private let dataSource: DataSourceType
    
    /**
     Initialization
     - parameter dataSource: Service class which implements DataSource protocol and actually fetches the data
     */
    init(dataSource: DataSourceType) {
        self.dataSource = dataSource
    }
    
    /**
     Fetch data from given DataSource
     - parameter completionHandler: Completion closure will be invoked when data is fetched and passed to the subscriber.
     */
    func fetchData(completionHandler: @escaping (DataSourceType.DataType?, Error?) -> Void) {
        dataSource.fetchData(completionHandler: completionHandler)
    }
}
