//
//  OpenWeatherMapRequest.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/18/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

import Swish

struct OpenWeatherMapRequest: Request {
    
    typealias ResponseObject = Weather
    
    let city: String
    let countryCode: String

    func build() -> URLRequest {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=New%20York,ny&appid=c6e5ebccfc3228ff574a5f02a561fca6")!
        return URLRequest(url: url)
    }
}
