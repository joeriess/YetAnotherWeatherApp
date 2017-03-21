//
//  WeatherView.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/16/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    let weather: [WeatherData]
}

struct WeatherData {
    let temperature: (current: String, high: String, low: String)
    let city: String
    let humidity: String
    let description: String
    let timeFetched: String
    let day: String
}

protocol WeatherView: class {
    func display(viewModel: WeatherViewModel)
}
