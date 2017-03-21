//
//  DisplayWeatherUseCase.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/20/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

import Result

typealias DisplayWeatherUseCaseCompletion = (Weather) -> Void // TODO: RESULT

protocol DisplayWeatherUseCase {
    func fetchWeather(completion: @escaping DisplayWeatherUseCaseCompletion)
}

final class DisplayWeatherDefaultUseCase: DisplayWeatherUseCase {
    
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func fetchWeather(completion: @escaping (Weather) -> Void) {
        weatherService.getWeather(for: "",
                                  countryCode: "",
                                  completion: completion)
    }
}
