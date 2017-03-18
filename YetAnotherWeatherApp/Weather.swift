//
//  Weather.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/18/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

import Argo
import Runes
import Curry

struct Coordinates {
    let latitude: Double
    let longitude: Double
}

extension Coordinates: Decodable {
    static func decode(_ json: JSON) -> Decoded<Coordinates> {
        return curry(self.init)
            <^> json <| "lat"
            <*> json <| "lon"
    }
}

struct Weather {
    let temperature: Temperature
    let coordinates: Coordinates
    let base: String
    let id: Int
    let name: String
}

extension Weather: Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Weather> {
        return curry(self.init)
            <^> json <| "main"
            <*> json <| "coord"
            <*> json <| "base"
            <*> json <| "id"
            <*> json <| "name"
    }
}
