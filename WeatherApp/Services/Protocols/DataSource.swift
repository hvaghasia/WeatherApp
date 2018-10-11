//
//  DataSource.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

/**
 Generic protocol which allows to work with diff Service to provide data e.g Server, Database, FileSystem etc
 */
protocol DataSource {
    /**
     Type we wan to fetch from source
     */
    associatedtype DataType where DataType: Decodable
    
    func fetchData(completionHandler: @escaping (DataType?, RequestError?) -> Void)
}
