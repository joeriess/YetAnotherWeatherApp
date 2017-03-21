//
//  WeatherViewConfigurator.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/20/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

struct WeatherViewConfigurator {
    
    func configure(view: WeatherViewController) {
        
        let displayWeatherUseCase = DisplayWeatherDefaultUseCase(weatherService: OpenWeatherMap())
        
        let presenter = WeatherDefaultPresenter(view: view,
                                                displayWeatherUseCase: displayWeatherUseCase)
        
        view.presenter = presenter
    }
}
