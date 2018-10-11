//
//  JsonEncodeDecode.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

extension Data {
    
    public func toDictionary() -> [String: Any]? {
        return self.parse() as? [String : Any]
    }
    
    public func toArray<T>() -> [T]? {
        return self.parse() as? [T]
    }
    
    func parse() -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.allowFragments)
        } catch {
            return nil
        }
    }
}
