//
//  WeatherPresenter.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/20/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

protocol WeatherPresenter {
    func loadContent()
}

final class WeatherDefaultPresenter: WeatherPresenter {
    
    private let displayWeatherUseCase: DisplayWeatherUseCase
    private weak var view: WeatherView?
    
    init(view: WeatherView,
         displayWeatherUseCase: DisplayWeatherUseCase) {
        
        self.view = view
        self.displayWeatherUseCase = displayWeatherUseCase
    }
    
    func loadContent() {
        displayWeatherUseCase.fetchWeather() { weather in
            
//            view?.display(viewModel: )
        }
    }
}
