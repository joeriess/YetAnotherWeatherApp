//
//  OpenWeatherMapWeatherService.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/18/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

import Swish

final class OpenWeatherMap: WeatherService {
    
    func getWeather(for city: String, countryCode: String, completion: @escaping (Weather) -> Void) {
        let request = OpenWeatherMapRequest(city: city, countryCode: countryCode)
        APIClient().perform(request) { result in
            switch result {
            case let .success(weather):
                completion(weather)
            case let .failure(error):
                print(error)
            }
        }
    }
}
