//
//  Temperature.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/18/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

import Argo
import Runes
import Curry

struct Temperature {
    let min: Double
    let man: Double
    let pressure: Int
    let humidity: Int
    let now: Double
}

extension Temperature: Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Temperature> {
        return curry(Temperature.init)
            <^> json <| "temp_min"
            <*> json <| "temp_max"
            <*> json <| "pressure"
            <*> json <| "humidity"
            <*> json <| "temp"
    }
}
