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
    private let viewModelBuilder = WeatherViewModelBuilder()
    private weak var view: WeatherView?
    
    init(view: WeatherView,
         displayWeatherUseCase: DisplayWeatherUseCase) {
        
        self.view = view
        self.displayWeatherUseCase = displayWeatherUseCase
    }
    
    func loadContent() {
        displayWeatherUseCase.fetchWeather() { weather in
            
            DispatchQueue.main.async {
                self.view?.display(viewModel: self.viewModelBuilder.build(from: weather))
            }
        }
    }
}

struct WeatherViewModelBuilder {
    
    func build(from weather: Weather) -> WeatherViewModel {
        print(weather)
        let weatherData = WeatherData(temperature: (current: "\(Int(weather.temperature.now))", high: "\(weather.temperature.man)", low: "\(weather.temperature.min)"),
                                      city: weather.name,
                                      humidity: "",
                                      description: "It's hot",
                                      timeFetched: "11AM",
                                      day: "TUES")
        return WeatherViewModel(weather: [weatherData])
    }
}
