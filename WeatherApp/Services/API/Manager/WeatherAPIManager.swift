//
//  WeatherAPIManager.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation
import Model
import CoreLocation
import Common

typealias WeatherCompletionHandler = (Weather?, RequestError?) -> Void

final class WeatherAPIManager {
    
    // MARK: - Properties
    
    private lazy var urlSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
        return session
    }()
    
    private lazy var configuration: Configuration? = {
        guard let url = Bundle.main.url(forResource: Constants.FileName.configuration, withExtension: Constants.FileExtension.plist) else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let configData = try decoder.decode(Configuration.self, from: data)
            return configData
        } catch {
            debugPrint("Parse Error : \(error.localizedDescription)")
        }
        
        return nil
    }()
    
    private func generateRequestURL(_ location: CLLocation) -> URL? {
        guard let configurationObject = configuration,
            var components = URLComponents(string: configurationObject.baseURL) else {
            return nil
        }
        
        let latitude = String(location.coordinate.latitude)
        let longitude = String(location.coordinate.longitude)
        
        components.queryItems = [URLQueryItem(name:"lat", value:latitude),
                                 URLQueryItem(name:"lon", value:longitude),
                                 URLQueryItem(name:"appid", value: configurationObject.owmAPIKey)]
        return components.url
    }
}

// MARK: - Fetch weather data

extension WeatherAPIManager {
    func fetchWeatherData<Model: Decodable>(for location: CLLocation,
                                            completionHandler: @escaping (Model?, RequestError?) -> Void) {
        
        guard let url = generateRequestURL(location) else {
            let error = RequestError.parserError
            completionHandler(nil, error)
            return
        }
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            // HTTP/Network error
            if let httpError = error {
                let error = RequestError.httpError(error: httpError)
                completionHandler(nil, error)
                return
            }
            
            // API error
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.isOK() else {
                if let jsonError = data?.toDictionary() {
                    print("API Error: \(jsonError)")
                    let error = RequestError.apiError(error: jsonError)
                    completionHandler(nil, error)
                }
                return
            }
            
            if let responseData = data {
                do {
                    let weatherObject = try JSONDecoder().decode(Model.self, from: responseData)
                    completionHandler(weatherObject, nil)
                } catch {
                    completionHandler(nil, RequestError.parserError)
                }
            }
        }
        task.resume()
    }
}
