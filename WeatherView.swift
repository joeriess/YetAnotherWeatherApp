//
//  WeatherView.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/16/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    let temperature: (current: String, high: String, low: String)
    let city: String
    let humidity: String
    let description: String
    let timeFetched: String
}

protocol WeatherView {
    func display(viewModel: WeatherViewModel)
}
