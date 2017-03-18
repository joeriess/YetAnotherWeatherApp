//
//  WeatherService.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/18/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

protocol WeatherService {
    func getWeather(for city: String, countryCode: String, completion: @escaping (Weather) -> Void)
}
