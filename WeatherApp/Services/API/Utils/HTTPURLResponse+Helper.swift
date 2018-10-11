//
//  HTTPURLResponse+Helper.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    
    public func isOK() -> Bool {
        return self.statusCode >= 200 && self.statusCode < 300
    }
    
}
